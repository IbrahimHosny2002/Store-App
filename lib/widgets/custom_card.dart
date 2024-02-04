import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(UpdateProduct.id, arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    spreadRadius: 20,
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(10, 10)),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0, 6),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${productModel.price.toString()}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 32,
            child: Image.network(
                height: 100, width: 100, productModel.image.toString()),
          ),
        ],
      ),
    );
  }
}
