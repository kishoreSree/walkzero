import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:walkzero/ForReusable/ReusableButtons.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';
import 'package:walkzero/log_in_screens/login_Screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      FlutterNativeSplash.remove();
    });
  }

  void onpressed1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => logIn_page()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: Column(children: [
          Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                child: Image.asset("assets/login_img.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40,
                width: 150,
                child: Image.asset("assets/Walkzero_Primary_logo.png"),
              ),
            ),
          ),
          Text("Single door solution for your Organization!",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[300])),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Buttons().elvatedButton(
              context,"Login", 125, 40, secondaryColor,
              16,
              // (context) => logIn_page()
              onpressed1,
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 30,
        child: Column(
          children: [
            Text(
              "By continuing you are agreeing to the following",
              style: TextStyle(color: Colors.blueGrey[250], fontSize: 10),
            ),
            const Text(
              "Terms of service & user Policies",
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 90, 163), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
