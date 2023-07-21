import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:walkzero/ForReusable/ReusableButtons.dart';
import 'package:walkzero/ForReusable/ReusableContainer.dart';
import 'package:walkzero/variables&datas/libraryForvariables.dart';

List<CameraDescription>? cameras;

class FaceScan extends StatefulWidget {
  const FaceScan({super.key});

  @override
  State<FaceScan> createState() => _FaceScanState();
}

class _FaceScanState extends State<FaceScan> {
  TextEditingController controller = TextEditingController();
  late CameraController _cameraController;
  bool flash = false;
  bool iscontrollerInitialized = false;
  late FaceDetector _faceDetector;

  Future initializeCamera() async {
    await _cameraController.initialize();
    iscontrollerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);
    setState(() {});
  }

  //InputImageRotation rotationIntToImageRotation(int rotation) {}

  Future<void> detectFacesfromImages(CameraImage image) async {}

  Future<void> _predictFacesfromImages({required CameraImage image}) async {}

  Future<void> takePicture() async {}

  @override
  void initState() {
    _cameraController = CameraController(cameras![1], ResolutionPreset.high);
    initializeCamera();
    _faceDetector = GoogleMlKit.vision.faceDetector(
        FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!iscontrollerInitialized || !_cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Facecapturing"),
      ),
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          Positioned(
              bottom: 50,
              child: Reusableconrainers().NormalContainer("Enter name", false,
                  false, 40, 400, Colors.white, 15, 13, controller)),
          Positioned(
            bottom: 0,
            left: 70,
            child: Buttons().elvatedButton(
                context, "Capture", 200, 50, secondaryColor, 10, captureImage),
          )
        ],
      ),
    );
  }

  captureImage() {
    
  }
}
