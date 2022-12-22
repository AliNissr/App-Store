import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/all_products_model.dart';

class UpdateServices {
  Future<AllProductsModel> putupdate(
      {required String price,
      required String titel,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    print ('id = = = $id');
    Map<String, dynamic> data = await Api().putapi(
      uri: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': titel,
        'price': price,
        'description': description,
        ' image ': image,
        'category': category,
      },
    );
    return AllProductsModel.fromjson(data);
  }
}