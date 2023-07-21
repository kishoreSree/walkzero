import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:walkzero/face_recognition/models/user.dart';
import 'package:walkzero/face_recognition/utils/hive_box.dart';
import 'package:walkzero/face_recognition/utils/utils.dart';
import 'package:image/image.dart' as imglib;


class MLService {
  late Interpreter interpreter;
  List? predictedArray;

  Future<User?> predict(
      CameraImage cameraImage, Face face, bool loginUser, String name) async {
    List input = _preprocess(cameraImage, face);

    List output = List.generate(1, (index) => List.filled(192, 0));

    await initializeInterpreter();

    interpreter.run(input, output);
    output = output.reshape([192]);

    predictedArray = List.from(output);

    if (!loginUser) {
      LocalDB.setUserDetails(User(name: name, array: predictedArray!));
      return null;
    } else {
      User? user = LocalDB.getUser();
      List userArray = user.array!;
      int mindist = 999;
      double threshold = 1.5;
      var dist = euclideanDistance(predictedArray!, userArray);
      if (dist <= threshold && dist < mindist) {
        return user;
      } else {
        return null;
      }
    }
  }

  euclideanDistance(List l1, List l2) {
    double sum = 0;
    for (int i = 0; i < l1.length; i++) {
      sum += pow(l1[i] - l2[i], 2);
    }
    return pow(sum, 0.5);
  }

  initializeInterpreter() async {
    Delegate? delegate;
    try {
      if (Platform.isAndroid) {
        delegate = GpuDelegateV2(
            options: GpuDelegateOptionsV2(
          isPrecisionLossAllowed: false,
          // inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
          // inferencePriority1: TfLiteGpuInferencePriority.minLatency,
          // inferencePriority2: TfLiteGpuInferencePriority.auto,
          // inferencePriority3: TfLiteGpuInferencePriority.auto,
        ));
      } else if (Platform.isIOS) {
        delegate = GpuDelegate(
            options: GpuDelegateOptions(
          allowPrecisionLoss: true,
          //waitType: tflGpu
        ));
      }

      var interpreterOptions = InterpreterOptions()..addDelegate(delegate!);

      interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);
    } catch (e) {
      printIfDebug("Failed to Load Model");
      printIfDebug(e);
    }
  }

  List _preprocess(CameraImage image, Face faceDetected) {
    return [];
  }
}
