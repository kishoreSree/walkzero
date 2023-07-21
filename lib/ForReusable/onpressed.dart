import 'package:flutter/material.dart';

class onpressed{
  void onpressed1(BuildContext context,dynamic page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }
}