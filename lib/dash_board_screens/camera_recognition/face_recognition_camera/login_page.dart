import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../ForReusable/ReusableButtons.dart';
import '../../../variables&datas/libraryForvariables.dart';
import 'face_scan.dart';

class LoginFace extends StatefulWidget {
  const LoginFace({super.key});

  @override
  State<LoginFace> createState() => _LoginFaceState();
}

class _LoginFaceState extends State<LoginFace> {
  late CameraController _cameraController;
  TextEditingController controller = TextEditingController();
  bool iscontrollerInitialized = false;
  Future initializeCamera() async {
    await _cameraController.initialize();
    iscontrollerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);
    setState(() {});
  }

  @override
  void initState() {
    _cameraController = CameraController(cameras![1], ResolutionPreset.high);
    initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!iscontrollerInitialized || !_cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("FaceCheck"),
      ),
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          Positioned(
            bottom: 0,
            left: 70,
            child: Buttons().elvatedButton(
                context, "Capture", 200, 50, secondaryColor, 10, Checkimage),
          )
        ],
      ),
    );
  }

  Checkimage() {}
}
