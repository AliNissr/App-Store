import 'package:storeapp/helper/api.dart';
import '../models/all_products_model.dart';

class GetAllProductsServices {
  Future<List<AllProductsModel>> getallproducts() async {
    //البيانات التي تائتي اما ماب او ليست
    List<AllProductsModel> allProductsModelList = [];
    List<dynamic> data =
    await Api().getapi(uri:'https://fakestoreapi.com/products');
    for (int i = 0; i < data.length; i++) {
      allProductsModelList.add(AllProductsModel.fromjson(data[i]));
    }

    return allProductsModelList;
  }
}
