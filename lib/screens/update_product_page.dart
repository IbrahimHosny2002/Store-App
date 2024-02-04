import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/product_services.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});
  static String id = 'updateproduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? title, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                CustomTextField(
                    hintText: 'Product Name',
                    function: (data) {
                      title = data;
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hintText: 'description',
                    function: (data) {
                      description = data;
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Price',
                  function: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    hintText: 'Image',
                    function: (data) {
                      image = data;
                    }),
                const SizedBox(
                  height: 30,
                ),
                CustoButtom(
                    textButtom: 'Update',
                    fun: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await upDateProduct(productModel);
                      } catch (e) {
                        throw Exception();
                      }
                      isLoading = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> upDateProduct(ProductModel productModel) async {
    await ProductServices().updateProduct(
        id: productModel.id.toString(),
        title: title == null ? productModel.title : title!,
        price: price == null ? productModel.price.toString() : price!,
        desc: description == null ? productModel.description : description!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
