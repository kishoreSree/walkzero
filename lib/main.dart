import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:walkzero/face_recognition/utils/hive_box.dart';
import 'package:walkzero/log_in_screens/1st_Screen.dart';
import 'package:walkzero/dash_board_screens/camera_recognition/face_recognition_camera/face_scan.dart';

Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await HiveBoxes.initialize();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  cameras = await availableCameras();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey),
    debugShowCheckedModeBanner: false,
    home: login_screen(),
  ));
}
