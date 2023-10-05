// ignore_for_file: use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:footer/footer.dart';

class sibiHuruf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
        body: SafeArea(
            child: Container(
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(222, 252, 249, 1),
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(60, 132, 171, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/huruf.png',
                        width: 75,
                        height: 75,
                      ),
                      const Text('HURUF SIBI',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.0,
                            color: Color.fromRGBO(54, 47, 217, 1),
                          ))
                    ],
                  ),
                )),
            Expanded(flex: 8, child: listSibi()),
            Footer(
              backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
              // border
              child: Column(children: const <Widget>[
                Text('Image by kemdikbud.go.id',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(54, 47, 217, 1),
                    )),
              ]),
              padding: const EdgeInsets.all(10.0),
            ),
          ]),
        )));
  }
}

class listSibi extends StatefulWidget {
  @override
  _HurufSibiState createState() => _HurufSibiState();
}

class _HurufSibiState extends State<listSibi> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(222, 252, 249, 1),
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore
            .collection('hurufSibi')
            .orderBy('huruf')
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? const Center(
                  child: Text('Error loading'),
                )
              : snapshot.hasData
                  ? GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: snapshot.data.docs
                          .map(
                            (e) => Card(
                              // ukuran card 100x100
                              elevation: 10.0,
                              margin: const EdgeInsets.all(15.0),
                              // border radius
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromRGBO(60, 132, 171, 1),
                                            Color.fromRGBO(133, 205, 253, 1),
                                          ],
                                        ),
                                      ),
                                      child: Image.network(
                                        e.get('url'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          // gradient color
                                          decoration: const BoxDecoration(
                                            // border radius
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.fromRGBO(
                                                    222, 252, 249, 1),
                                                Color.fromRGBO(
                                                    222, 252, 249, 1),
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              e.get('huruf'),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 22.0,
                                                color: Color.fromRGBO(
                                                    54, 47, 217, 1),
                                              ),
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    ));
  }
}
