// ignore_for_file: file_names, unnecessary_this, avoid_print

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

class TensorFlowService {
  // singleton boilerplate
  static final TensorFlowService _tensorflowService =
      TensorFlowService._internal();

  factory TensorFlowService() {
    return _tensorflowService;
  }
  // singleton boilerplate
  TensorFlowService._internal();

  // ignore: close_sinks
  StreamController<List<dynamic>> _recognitionController =
      StreamController<List<dynamic>>.broadcast();
  Stream<List<dynamic>> get recognitionStream => _recognitionController.stream;

  bool _modelLoaded = false;

  Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/modelsibi/model_sibi_quant.tflite",
        labels: "assets/modelsibi/labels.txt",
      );
      _modelLoaded = true;
    } catch (e) {
      print('error loading model');
      print(e);
    }
  }

  Future<void> runModel(CameraImage img) async {
    if (_modelLoaded) {
      List<dynamic> recognitions = await Tflite.runModelOnFrame(
        bytesList: img.planes.map((plane) => plane.bytes).toList(),
        imageHeight: img.height,
        imageWidth: img.width,
        numResults: 1,
        threshold: 0.1,
      );
      print(recognitions);
      // shows recognitions on screen
      if (recognitions.isNotEmpty) {
        print(recognitions[0].toString());
        if (_recognitionController.isClosed) {
          // restart if was closed
          _recognitionController = StreamController<List<dynamic>>.broadcast();
        }
        // notify listeners
        _recognitionController.add(recognitions);
      }
    }
  }

  Future<void> stopRecognitions() async {
    if (!_recognitionController.isClosed) {
      _recognitionController.add(null);
      _recognitionController.close();
    }
  }

  void dispose() async {
    Tflite.close();
    _recognitionController.close();
  }
}
