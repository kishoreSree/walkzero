library global_Variables;

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

int selectedindex = 0;
ValueNotifier<bool> obscureText1 = ValueNotifier<bool>(true);
Color primaryColor = Color(0xFF1a2d48);
Color secondaryColor = Color(0xFFf45600);
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool more = false;
String error = "";
InputImage? referenceImage;
InputImage? comparisonImage;

