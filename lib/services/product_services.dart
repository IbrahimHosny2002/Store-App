import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class ProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> response =
        await Api().get(uri: 'https://fakestoreapi.com/products');
    List<ProductModel> productList = [];
    for (int i = 0; i < response.length; i++) {
      productList.add(ProductModel.fromJson(response[i]));
    }
    return productList;
  }

  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> response = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      },
    );

    return ProductModel.fromJson(response);
  }

  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required String id,
  }) async {
    Map<String, dynamic> response = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      },
    );

    return ProductModel.fromJson(response);
  }
}
