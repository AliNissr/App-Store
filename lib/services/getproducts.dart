import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapp/models/all_products_model.dart';
class GetProducts {
  Future<List<AllProductsModel>> getgetget() async {
    List<AllProductsModel> alialiali = [];
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      List<dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        alialiali.add(AllProductsModel.fromjson(data[i]));
      }
    } catch (e) {
      print ("___________________________________________________________________$e");
    }
    return alialiali;
  }
}