import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GategoriesServices {
  Future<dynamic> gatAllCategories() async {
    List<dynamic> response =
        await Api().get(uri: 'https://fakestoreapi.com/products/categories');

    return response;
  }

  Future<List<ProductModel>> getProductsByCatgeories(
      {required String categoryName}) async {
    List<dynamic> response = await Api()
        .get(uri: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList = [];
    for (int i = 0; i < response.length; i++) {
      productList.add(ProductModel.fromJson(response[i]));
    }
    return productList;
  }
}
