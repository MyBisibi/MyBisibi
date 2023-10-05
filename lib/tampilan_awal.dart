// ignore_for_file: use_key_in_widget_constructors, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_bisibi/kamus/kamus_sibi.dart';
import 'package:my_bisibi/kuis/kuis_sibi.dart';
import 'package:my_bisibi/terjemah/camera_screen.dart';
import 'package:camera/camera.dart';

class tampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
      body: SafeArea(
        child: Column(
          children: [
            // Container untuk Logo dan nama aplikasi - awal
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Transform(
                          transform: Matrix4.translationValues(0.0, 10.0, 10.0),
                          child: gambarLogo()),
                    ),
                    const Center(
                      child: Text(
                        'MYBISIBI',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 47, 217, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container untuk Logo dan nama aplikasi - akhir
            // Container untuk button - awal
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 70.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                              width: 280.0,
                              child: Center(child: buttonAwalKamus()))),
                      Flexible(
                          child: Container(
                              width: 280.0,
                              child: Center(child: buttonAwalKuis()))),
                      Flexible(
                          child: Container(
                              width: 280.0,
                              child: Center(child: buttonAwalTerjemah()))),
                    ],
                  ),
                ),
              ),
            ),
            // Container untuk button - akhir
          ],
        ),
      ),
    );
  }
}

// class gambar logo

class gambarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/Logo.png'),
      height: 175.0,
    );
  }
}

// button untuk beralih ke halaman tampilan awal kamus

class buttonAwalKamus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return kamusSibi();
        }));
      },
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(60, 132, 171, 1),
                Color.fromRGBO(133, 205, 253, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                  height: 100.0,
                  // color: Colors.grey,
                  child: const OverflowBox(
                    maxWidth: double.infinity,
                    maxHeight: double.infinity,
                    child: Image(
                      image: AssetImage('assets/images/Kamus.png'),
                      height: 115.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      'Kamus',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// button untuk beralih ke halaman tampilan awal terjemah

class buttonAwalTerjemah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final cameras = await availableCameras();
        final backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => null,
        );
        if (backCamera != null) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraScreenSibi(camera: backCamera),
            ),
          );
        } else {
          // ignore: avoid_print
          print('Back camera not available');
        }
      },
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(60, 132, 171, 1),
                Color.fromRGBO(133, 205, 253, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                  height: 100.0,
                  // color: Colors.grey,
                  child: const OverflowBox(
                    maxWidth: double.infinity,
                    maxHeight: double.infinity,
                    child: Image(
                      image: AssetImage('assets/images/Terjemahan.png'),
                      height: 115.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      'Penerjemah',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buttonAwalKuis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const kuisSibi();
        }));
      },
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(60, 132, 171, 1),
                Color.fromRGBO(133, 205, 253, 1),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                  height: 100.0,
                  // color: Colors.grey,
                  child: const OverflowBox(
                    maxWidth: double.infinity,
                    maxHeight: double.infinity,
                    child: Image(
                      image: AssetImage('assets/images/Logo Quiz.png'),
                      height: 115.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      'Kuis',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
