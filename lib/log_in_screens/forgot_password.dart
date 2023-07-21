import 'package:flutter/material.dart';
import 'package:walkzero/ForReusable/ReusableButtons.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(color: primaryColor),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 400,
              child: Image.asset("assets/forgot-password.png"),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 3),
                      child: Text(
                        "Enter Your email and We'll send you a link to reset your",
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.only(left: 130)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Buttons().elvatedButton(context, "Send Email", 200, 40,
                        secondaryColor, 10, () => null)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
