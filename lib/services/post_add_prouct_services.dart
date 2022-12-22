
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/all_products_model.dart';

class PostAddPoructSrevices {
 Future<AllProductsModel> postprouct(
      {required String price,
      required String titel,
      required String description,
      required String image,
      required String category}) async{
   Map<String , dynamic> data =await
     Api().postapi(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': 'test product',
        'price': '13.5',
        'description': 'lorem ipsum set',
        ' image: https': '//i.pravatar.cc',
        'category': 'electronic'
      },
    );
   return AllProductsModel.fromjson(data);
  }
}
/*
() async{
http.Response response =await http.post(Uri.parse('https://fakestoreapi.com/products') ,
body: {'title' : 'test product',
'price': '13.5',
'description': 'lorem ipsum set',
' image: https':'//i.pravatar.cc',
'category': 'electronic'
}, headers: {
'Accept' : 'application/json',
'Content-Type' : 'application/x-www-form-urlencoded',
'Authorization' : 'Bearar '
}
);
print (response.body);
},*/