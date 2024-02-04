import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField(
      {this.keyboard, this.function, required this.hintText, super.key});
  final Function(String)? function;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: function,
      keyboardType: keyboard,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
              ))),
    );
  }
}
