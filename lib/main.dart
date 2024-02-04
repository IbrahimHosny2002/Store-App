import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProduct.id:(context) => const UpdateProduct(),
        AddProduct.id:(context) => const AddProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}
