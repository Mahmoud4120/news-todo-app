import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String? text;
  Color? color;
  Function()? onTap;
  Category({required this.color, required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 20),
        width: double.infinity,
        height: 60,
        alignment: AlignmentDirectional.centerStart,
        color: color,
        child: Text(
          text!,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}


