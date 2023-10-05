// ignore_for_file: file_names, prefer_final_fields, avoid_print, unnecessary_this

import 'package:camera/camera.dart';
import 'tflite-service.dart';

class CameraService {
  // singleton boilerplate
  static final CameraService _cameraService = CameraService._internal();

  factory CameraService() {
    return _cameraService;
  }
  // singleton boilerplate
  CameraService._internal();

  TensorFlowService _tensorFlowService = TensorFlowService();

  bool available = true;
  CameraController _cameraController;
  CameraController get cameraController => _cameraController;

  Future startService(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.veryHigh,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    return _cameraController.initialize();
  }

  Future<void> startStreaming() async {
    _cameraController.startImageStream((img) async {
      try {
        if (available) {
          // Loads the model and recognizes frames
          available = false;
          await _tensorFlowService.runModel(img);
          await Future.delayed(const Duration(seconds: 1));
          available = true;
        }
      } catch (e) {
        print('error running model with current frame');
        print(e);
      }
    });
  }

  Future stopImageStream() async {
    await this._cameraController.stopImageStream();
  }

  dispose() {
    _cameraController.dispose();
  }
}
