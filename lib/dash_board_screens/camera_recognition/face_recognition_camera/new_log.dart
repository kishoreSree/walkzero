import 'package:flutter/material.dart';
import 'package:walkzero/face_recognition/utils/hive_box.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({super.key});

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi..${LocalDB.getUser().name}"),
      ),
    );
  }
}
