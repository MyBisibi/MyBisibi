// ignore_for_file: library_private_types_in_public_api, avoid_print, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'services/tflite-service.dart';
import 'services/camera-service.dart';
import 'dart:async';

class CameraScreenSibi extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreenSibi({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _CameraScreenSibiState createState() => _CameraScreenSibiState();
}

class _CameraScreenSibiState extends State<CameraScreenSibi>
    with TickerProviderStateMixin, WidgetsBindingObserver {
//  final CameraDescription camera = get_camera();
  Future<void> _initializeControllerFuture;
  final TensorFlowService _tensorFlowService = TensorFlowService();
  final CameraService _cameraService = CameraService();

//  Prediction _prediction = Prediction();

  // current list of recognition
  List<dynamic> _currentRecognition = [];
  List<dynamic> _savedPredictions = <String>[''];

  // listens the changes in tensorflow recognitions
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startUp();
  }

  startRecognitions() async {
    try {
      // starts the camera stream on every frame and then uses it to recognize the result every 1 second
      _cameraService.startStreaming();
    } catch (e) {
      print('error streaming camera image');
      print(e);
    }
  }

  stopRecognitions() async {
    // closes the streams
    await _cameraService.stopImageStream();
    await _tensorFlowService.stopRecognitions();
  }

  Future startUp() async {
    if (!mounted) {
      return;
    }
    if (_initializeControllerFuture == null) {
      _initializeControllerFuture =
          _cameraService.startService(widget.camera).then((value) async {
        await _tensorFlowService.loadModel();
        startRecognitions();
      });
    } else {
      await _tensorFlowService.loadModel();
      startRecognitions();
    }
  }

  _onSaveButtonPressed() async {
    String recognizedText = "";

    for (int i = 0; i < _currentRecognition.length; i++) {
      setState(() {
        // apabila memprediksi Black, maka jangan disimpan
        if (_currentRecognition[i]['label'] != "Blank") {
          recognizedText += _currentRecognition[i]['label'] + "";
        } else {
          _savedPredictions.add("");
        }
      });
    }

    recognizedText = recognizedText.trim(); // hapus whitespace di akhir kalimat

    // Simpan hasil prediksi ke dalam list
    List<String> predictionList = _savedPredictions;
    predictionList.add(recognizedText);

    // Gabungkan hasil prediksi menjadi sebuah kata
    String combinedPrediction = predictionList.join(" ");

    // Do something with combined prediction here, misalnya:
    print("Combined prediction: $combinedPrediction");

    // Simpan hasil prediksi ke dalam state
    setState(() {
      _savedPredictions = predictionList;
    });
  }

  _onClearButtonPressed() {
    setState(() {
      _savedPredictions = <String>[];
    });
  }

  _deleteLastPrediction() {
    setState(() {
      _savedPredictions.removeLast();
    });
  }

  _onSpasiButtonPressed() {
    setState(() {
      _savedPredictions.add(" ");
    });
  }

  _startRecognitionStreaming() {
    if (_streamSubscription == null) {
      print("start streaming");
      _streamSubscription =
          _tensorFlowService.recognitionStream.listen((recognition) {
        if (recognition != null) {
          // rebuilds the screen with the new recognitions
          setState(() {
            _currentRecognition = recognition;
          });

          // check if accuracy is above 65%
          double accuracy = 0.0;
          for (int i = 0; i < _currentRecognition.length; i++) {
            accuracy += _currentRecognition[i]['confidence'];
          }
          accuracy /= _currentRecognition.length;
          if (accuracy > 0.90) {
            // add each detected letter to the saved predictions list
            for (int i = 0; i < _currentRecognition.length; i++) {
              setState(() {
                // apabila memprediksi Black, maka jangan disimpan
                if (_currentRecognition[i]['label'] != "Blank") {
                  _savedPredictions.add(_currentRecognition[i]['label']);
                } else {
                  _savedPredictions.add("");
                }
              });
            }
          }
        } else {
          _currentRecognition = [];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
      // appBar: AppBar(
      //   title: const Text("Terjemah Sibi"),
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(60, 132, 171, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/images/SIBI.png',
                          height: 35,
                          width: 35,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 12, bottom: 10, right: 20),
                          child: const Text(
                            'SIBI',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(222, 252, 249, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(60, 132, 171, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 20),
                      child: Text(
                        'Hasil: ${_savedPredictions.join("")}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(222, 252, 249, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        _startRecognitionStreaming();
                        return Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: <Widget>[
                              CameraPreview(_cameraService.cameraController),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromRGBO(60, 132, 171, 1),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(children: <Widget>[
                                            // shows recognitions list
                                            _contentWidget(),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  // ignore: avoid_unnecessary_containers
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        TextButton(
                                                          style: ButtonStyle(
                                                            fixedSize:
                                                                MaterialStateProperty
                                                                    .all(const Size(
                                                                        170,
                                                                        50)),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Colors
                                                                        .green),
                                                          ),
                                                          onPressed:
                                                              _onSaveButtonPressed,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: const [
                                                              Text(
                                                                'Tambahkan',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                ),
                                                              ),
                                                              Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 40,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        TextButton(
                                                            style: ButtonStyle(
                                                              fixedSize:
                                                                  MaterialStateProperty.all(
                                                                      const Size(
                                                                          170,
                                                                          50)),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .blue),
                                                            ),
                                                            onPressed:
                                                                _onSpasiButtonPressed,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: const [
                                                                Text('Spasi',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                    )),
                                                                Icon(
                                                                  Icons
                                                                      .space_bar,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40,
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  // ignore: avoid_unnecessary_containers
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            TextButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  fixedSize: MaterialStateProperty.all(
                                                                      const Size(
                                                                          170,
                                                                          50)),
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          57,
                                                                          55,
                                                                          55)),
                                                                ),
                                                                onPressed:
                                                                    _deleteLastPrediction,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: const [
                                                                    Text(
                                                                        'Hapus',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color: Color.fromRGBO(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              1),
                                                                        )),
                                                                    Icon(
                                                                      Icons
                                                                          .backspace,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 40,
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        TextButton(
                                                            style: ButtonStyle(
                                                              fixedSize:
                                                                  MaterialStateProperty.all(
                                                                      const Size(
                                                                          170,
                                                                          50)),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                          .red),
                                                            ),
                                                            onPressed:
                                                                _onClearButtonPressed,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: const [
                                                                Text(
                                                                  'Clear',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons.clear,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 40,
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentWidget() {
    var _width = MediaQuery.of(context).size.width;
    var _padding = 20.0;
    var _labelWitdth = 150.0;
    var _labelConfidence = 30.0;
    var _barWitdth = _width - _labelWitdth - _labelConfidence - _padding * 2.0;

    if (_currentRecognition.isNotEmpty) {
      return Container(
        padding: EdgeInsets.only(top: _padding),
        height: 50,
        child: ListView.builder(
          itemCount: _currentRecognition.length,
          itemBuilder: (context, index) {
            if (_currentRecognition.length > index) {
              print(_currentRecognition[index]['label']);
              return Container(
                height: 25,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: _padding, right: _padding),
                      width: _labelWitdth,
                      child: Text(_currentRecognition[index]['label'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                    Container(
                      width: _barWitdth,
                      child: LinearProgressIndicator(
                        backgroundColor: const Color.fromARGB(0, 238, 236, 236),
                        value: _currentRecognition[index]['confidence'],
                      ),
                    ),
                    Container(
                      width: _labelConfidence,
                      child: Text(
                          (_currentRecognition[index]['confidence'] * 100)
                                  .toStringAsFixed(0) +
                              '%',
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )
//                        overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      );
    } else {
      return const Text('');
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _cameraService.dispose();
    _tensorFlowService.dispose();
    _initializeControllerFuture = null;
//    _streamSubscription?.cancel();
    super.dispose();
  }
}
