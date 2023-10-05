// ignore_for_file: camel_case_types, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_bisibi/kamus/sibi_huruf.dart';
import 'package:my_bisibi/kamus/angka_sibi.dart';
import 'package:my_bisibi/kamus/sibi_kata_tanya.dart';
import 'package:my_bisibi/kamus/sibi_hari.dart';

class kamusSibi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Transform(
                        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        child: const Image(
                          image: AssetImage('assets/images/SIBI.png'),
                          height: 150.0,
                        )),
                  ),
                  const Center(
                    child: Text(
                      'kamus Sibi',
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
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonHurufSibi(),
                          buttonAngkaSibi(),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonKataTanyaSibi(),
                          buttonHariSibi(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

// class untuk berpindah halaman ke halaman huruf sibi

class buttonHurufSibi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sibiHuruf();
        }));
      },
      child: Container(
          width: 175.0,
          height: 200.0,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 140.0,
                child: const Image(
                  image: AssetImage('assets/images/huruf.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    // color gradient horizontal
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(222, 252, 249, 1),
                        Color.fromRGBO(222, 252, 249, 1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Huruf',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}

// class untuk berpindah halaman ke halaman angka sibi
class buttonAngkaSibi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sibiAngka();
        }));
      },
      child: Container(
          width: 175.0,
          height: 200.0,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 140.0,
                child: const Image(
                  image: AssetImage('assets/images/angka.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(222, 252, 249, 1),
                        Color.fromRGBO(222, 252, 249, 1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Angka',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}

// fungsi untuk beralih ke kamus kata tanya sibi
class buttonKataTanyaSibi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sibiKataTanya();
        }));
      },
      child: Container(
          width: 175.0,
          height: 200.0,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 140.0,
                child: const Image(
                  image: AssetImage('assets/images/kata-tanya.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    // color gradient horizontal
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(222, 252, 249, 1),
                        Color.fromRGBO(222, 252, 249, 1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Kata Tanya',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}

// class untuk berpindah halaman ke halaman bulan dan hari sibi
class buttonHariSibi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return sibiHariBulan();
        }));
      },
      child: Container(
          width: 175.0,
          height: 200.0,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 140.0,
                child: const Image(
                  image: AssetImage('assets/images/hari.png'),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    // color gradient horizontal
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(222, 252, 249, 1),
                        Color.fromRGBO(222, 252, 249, 1),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Hari',
                      style: TextStyle(
                        color: Color.fromRGBO(54, 47, 217, 1),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
