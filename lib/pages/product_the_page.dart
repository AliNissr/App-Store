import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/all_products_model.dart';
import '../services/update_services.dart';
import '../widgets/the_widget_button.dart';
import '../widgets/the_widgets_textfromfiled.dart';

class ProductThePages extends StatefulWidget {
  static String id = 'thepageproduct';

  @override
  State<ProductThePages> createState() => _ProductThePagesState();
}

class _ProductThePagesState extends State<ProductThePages> {
  String? productName , image , desc;
  String? price;
  bool isLoding = false;
  @override
  Widget build(BuildContext context) {
    AllProductsModel product =
        ModalRoute.of(context)!.settings.arguments as AllProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Udata Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                BuildTextFilde(
                  onChanged: (data) {
                    productName = data;
                  },
                  lablehiting: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                BuildTextFilde(
                  onChanged: (data) {
                    desc = data;
                  },
                  lablehiting: 'Description',
                ),
                SizedBox(
                  height: 10,
                ),
                BuildTextFilde(
                  onChanged: (data) {
                    price =data ;
                  },
                  lablehiting: 'Price',
                  numbers: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                BuildTextFilde(
                  onChanged: (data) {
                    image = data;
                  },
                  lablehiting: 'image',
                ),
                SizedBox(
                  height: 50,
                ),
                BuildTextButton(
                    title_button: "Up Data",
                    ontap: () async{
                      isLoding = true;
                      setState(() {});
                      try{
                        await updatamethod(product) ;
                        print ('classed');
                      }catch(e){
                        print (e.toString());
                      }
                      isLoding = false;
                      setState(() {});
                    },
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future updatamethod(AllProductsModel product) async{
    await UpdateServices().putupdate(
        id: product.id,
        price: price == null ? product.price : price!,
        titel: productName == null ? product.title : productName!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
