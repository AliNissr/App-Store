
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/all_products_model.dart';
class GetCategoriesServices{
  Future<List<AllProductsModel>> getcategories (category_name) async{
    // ملاحضة ميصير يجي ب uri نقطتان واسم هكذا (https://fakestoreapi.com/products/category/:category_name) معناه هذا انو يجب على اليوزر ادخال هذا الاسم
      List<dynamic> data =await Api().getapi(uri: 'https://fakestoreapi.com/products/category/$category_name');
      List<AllProductsModel> allproductsmodellist = [];
      for (int i = 0 ; i < data.length ; i++){
        allproductsmodellist.add(AllProductsModel.fromjson(data[i]));
      }
      return allproductsmodellist;
  }
}
