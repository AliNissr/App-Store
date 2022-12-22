import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/all_products_model.dart';
import '../services/all_products_services.dart';
//import '../services/getproducts.dart';
import '../widgets/the_widget_use.dart';

class HomePage extends StatelessWidget {
  static String id = 'Homepage' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ال (elevation) هذا الخاصية تعمل على جعل الاببار كانهو فوق الصفحه نتحكم بقيمتها فيضهر التغير
        elevation: 0,
         backgroundColor: Colors.white10,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black)
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 20),
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                 color: Colors.black,
              ))
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light ,
      ),
        body: Padding(
          padding:  EdgeInsets.only(right: 10 , left: 10 , top: 60),
          child: FutureBuilder<List<AllProductsModel>> (
            future: GetAllProductsServices().getallproducts(),
            builder: (context, snapshot)
            {
              if (snapshot.hasData)  {
                List<AllProductsModel> allProductsModel = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                  clipBehavior: Clip.none ,
                  itemCount: allProductsModel.length,
                  itemBuilder: (context, index) {
                    return WidgetContainerCard(allProductsModel[index]);
                  },
                );
              }
              else{
                return
                Center(
                child: LinearProgressIndicator(),
              );}
            },
          ),
        )
    );
  }
}
