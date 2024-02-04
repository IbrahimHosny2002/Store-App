import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/product_services.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static String id = 'addproduct';

  @override
  State<AddProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<AddProduct> {
  String? title, description, image, price, category;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Add Product',
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
                  height: 10,
                ),
                CustomTextField(
                    hintText: 'Category',
                    function: (data) {
                      category = data;
                    }),
                const SizedBox(
                  height: 30,
                ),
                CustoButtom(
                    textButtom: 'Add',
                    fun: () async {
                      isLoading = true;
                      setState(() {});
                      await addProduct();
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

  Future<void> addProduct() async {
    await ProductServices().addProduct(
        title: title!,
        price: price!,
        desc: description!,
        image: image!,
        category: category!);
  }
}
