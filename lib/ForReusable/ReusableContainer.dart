
import 'package:flutter/material.dart';
import 'package:walkzero/ForReusable/login_validation.dart';

import '../variables&datas/libraryForvariables.dart';

class Reusableconrainers {
  final formValidation = FormValidation();
  Widget Container1(String title, bool Email, bool password) {
    return Center(
      child: Container(
        height: 40,
        width: 350,
        decoration: BoxDecoration(
            border: Border.all(width: 0.7, color: primaryColor),
            borderRadius: BorderRadius.circular(5)),
        child: ValueListenableBuilder<bool>(
            valueListenable: obscureText1,
            builder: (context, value, child) {
              return StreamBuilder<String>(
                  stream: Email
                      ? formValidation.emailStream
                      : formValidation.passwordStream,
                  builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller:
                            Email ? emailController : passwordController,
                        obscureText: password && obscureText1.value,
                        onChanged: (value) {
                          if (Email) {
                            formValidation.validateEmail(value);
                          } else {
                            formValidation.validatePassword(value);
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14),
                          hintText: title,
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 6),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          errorText: snapshot.error as String?,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (password == true) {
                                  obscureText1.value = !obscureText1.value;
                                }
                              },
                              icon: Icon(
                                Email
                                    ? Icons.mail
                                    : obscureText1.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }

  Widget NormalContainer(String title, bool suffix, bool Preffix, double height,
      double width, Color colors, double borderRadius, double fontsize,TextEditingController controller) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          //border: Border.all(width: 0.7, color: primaryColor),
          borderRadius: BorderRadius.circular(borderRadius),
          color: colors,
        ),
        child: ValueListenableBuilder<bool>(
            valueListenable: obscureText1,
            builder: (context, value, child) {
              return TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: fontsize),
                    hintText: title,
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15)),
              );
            }),
      ),
    );
  }

  Widget buildSuffix(Icons icon, Function() onpressed) {
    return Container();
  }

  Widget buildPreffix(Icons icon, Function() onpressed) {
    return Container();
  }

  Widget reuasableText(
      String Names, double fontsize, FontWeight? fontweight, Color? color) {
    return Text(
      Names,
      style:
          TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color),
    );
  }
}
