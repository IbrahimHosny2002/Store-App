import 'package:flutter/material.dart';

class CustoButtom extends StatelessWidget {
  final String textButtom;
  final VoidCallback? fun;
  const CustoButtom({this.fun,required this.textButtom, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            textButtom,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
