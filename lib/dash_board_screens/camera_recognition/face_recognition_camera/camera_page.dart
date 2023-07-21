//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:walkzero/ForReusable/ReusableButtons.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final LocalAuthentication auth;
  bool _suuportState = false;
  List<int> _allowedFingerPrint=[];

   Future<void> _athendicate() async {
    try {
      bool authdicated = await auth.authenticate(
          localizedReason: "Subscribe or you will never go in",
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: false));

      print("Athendicated: $authdicated");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // printIfDebug(LocalDB.getUser().name);
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        _suuportState = isSupported;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facial-recognition"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Buttons().elvatedButton(context, "Register", 100, 50, primaryColor,
                10, onpressedFunction),
            SizedBox(
              height: 10,
            ),
            Buttons().elvatedButton(context, "log-in", 100, 50, primaryColor,
                10, onpressedFunction1),
            if (_suuportState)
              const Text('this device is supported bioMatric')
            else
              const Text("This device is not Supported bioMatric"),
            // ElevatedButton(
            //     onPressed: () {
            //       _getAvailableBioMatrics();
            //     },
            //     child: const Text("GetBioMatric")),
            ElevatedButton(
                onPressed: () {
                  _athendicate();
                },
                child: const Text("Athendicate")),
          ],
        ),
      ),
    );
  }

  Future<void> compareImages() async {
    if (referenceImage == null || comparisonImage == null) {
      return;
    }

    final faceDetector = GoogleMlKit.vision.faceDetector();

    final List<Face> referencefaces =
        await faceDetector.processImage(referenceImage!);
    final List<Face> comparisonfaces =
        await faceDetector.processImage(comparisonImage!);

    // if (referencefaces.isEmpty && comparisonfaces.isEmpty) {
    //   print("No faces detected");
    //   await faceDetector.close();
    //   return;
    // }

    // double highestConfidence = 0.0;
    // for (final referenceFace in referencefaces) {
    //   for (final comparisonFace in comparisonfaces) {
    //     final double confidence =
    //         calculateFaceSimilarity(referenceFace, comparisonFace);
    //     if (confidence > highestConfidence) {
    //       highestConfidence = confidence;
    //     }
    //   }
    // }
    // if (highestConfidence > 0.8) {
    //   print("Image Match");
    // } else {
    //   print("Image Does Not match");
    // }

    if (referencefaces.isNotEmpty && comparisonfaces.isNotEmpty) {
      final Face referenceFace = referencefaces.first;
      final Face comparisonFace = comparisonfaces.first;

      final double confidence =
          comparisonFace.trackingId == referenceFace.trackingId ? 1.0 : 0.0;

      if (confidence > 0.8) {
        print("Image Match");
      } else {
        print("Images do not match");
      }
    } else {
      print("No faces detected");
    }
    await faceDetector.close();
  }

  Future<void> onpressedFunction() async {
    //onpressed().onpressed1(context, FaceScan());
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => FaceScan()),
    // );
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final inputImage = InputImage.fromFilePath(pickedImage.path);
      setState(() {
        referenceImage = inputImage;
        print("Registerd");
      });
    }
  }

  // onpressed().onpressed1(context, LoginFace());
  Future<void> onpressedFunction1() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      final inputImage = InputImage.fromFilePath(pickedImage.path);
      setState(() {
        comparisonImage = inputImage;
      });
      compareImages();
    }
  }

  Future<void> _getAvailableBioMatrics() async {
    List<BiometricType> availableBioMatrics =
        await auth.getAvailableBiometrics();
    print("List of availabaleBioMatrics :$availableBioMatrics");

    if (!mounted) {
      return;
    }
  }

 
}
