import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:walkzero/ForReusable/ReusableButtons.dart';
import 'package:walkzero/ForReusable/ReusableContainer.dart';
import 'package:walkzero/ForReusable/login_validation.dart';
import 'package:walkzero/ForReusable/onpressed.dart';
import 'package:walkzero/dash_board_screens/first_dashboard.dart';
import 'package:walkzero/log_in_screens/forgot_password.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';
import 'package:walkzero/variables&datas/local_storage.dart';

class logIn_page extends StatefulWidget {
  const logIn_page({super.key});

  @override
  State<logIn_page> createState() => _logIn_pageState();
}

class _logIn_pageState extends State<logIn_page> {
  final List<Map<String, String>> imagelist = [
    {
      'image': 'assets/employees.png',
      'Description': "Look your colleagues & Friends"
    },
    {
      'image': 'assets/attendance.png',
      'Description': "Track your attendance days"
    },
    {
      'image': 'assets/Location tracking-rafiki.png',
      'Description': "Attendence Maintaining Using Geofencing"
    },
    {'image': 'assets/EmailCapture.png', 'Description': "Apply Leave easily"}
  ];
  bool ischecked = false;

  onpressed onpressedInstance = onpressed();

  @override
  void initState() {
    super.initState();
    getStoreddata();
  }

  Future getStoreddata() async {
    final name = await LocalStorage.getEmail() ?? '';
    final pass = await LocalStorage.getPassword() ?? '';
    final newemailcontroller = TextEditingController(text: name);
    final newpasswordcontroller = TextEditingController(text: pass);
    setState(() {
      emailController = newemailcontroller;
      passwordController = newpasswordcontroller;
    });
  }

  @override
  void dispose() {
    FormValidation().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              color: primaryColor,
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
                items: imagelist.map((item) {
                  return Builder(builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          // decoration: BoxDecoration(
                          //     border:
                          //         Border.all(width: 8, color: primaryColor)),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item['Description']!,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                    height: 270,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: true)),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome to Walkzero",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Reusableconrainers().Container1("Email*", true, false),
            const SizedBox(
              height: 20,
            ),
            Reusableconrainers().Container1("Password*", false, true),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 30),
              child: Row(
                children: [
                  Checkbox(
                    value: ischecked,
                    fillColor:
                        MaterialStateProperty.all<Color?>(Color(0xFFf45600)),
                    onChanged: (value) async {
                      await LocalStorage.setEmail(emailController.text);
                      await LocalStorage.setPassword(passwordController.text);
                      setState(() {
                        ischecked = !ischecked;
                      });
                    },
                    side: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                  const Text(
                    "Remember Me",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: Color(0xFFf45600),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Buttons().elvatedButton(
                context,
                "Login",
                200,
                40,
                const Color(0xFFf45600),
                5,
                () => onpressedInstance.onpressed1(context, DashBoard1())),
            Container(
              height: 150,
              width: double.infinity,
              // decoration: BoxDecoration(
              //     border: Border.all(width: 15, color: primaryColor)),
              child: Image.asset('assets/logo.gif'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 30,
        child: Center(
          child: Text(
            "Single door solution for your organization!",
            style: TextStyle(fontSize: 11, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
