// ignore_for_file: use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:footer/footer.dart';

class sibiHariBulan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
      body: SafeArea(
          // tampilkan list angka sibi menggunakan card
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
                      'assets/images/hari.png',
                      width: 75.0,
                      height: 75.0,
                    ),
                    const Text('HARI SIBI',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          color: Color.fromRGBO(54, 47, 217, 1),
                        ))
                  ],
                ),
              )),
          Expanded(flex: 10, child: listSibiBulanDanHari()),
          Footer(
            backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
            child: Column(children: const <Widget>[
              Text(
                'Video by Wenda Alifulloh',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(54, 47, 217, 1),
                ),
              ),
            ]),
            padding: const EdgeInsets.all(10.0),
          ),
        ]),
      )),
    );
  }
}

class listSibiBulanDanHari extends StatelessWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(222, 252, 249, 1),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore
              .collection('bulandanhariSibi')
              .orderBy('u')
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasError
                ? const Center(
                    child: Text('Error loading'),
                  )
                : snapshot.hasData
                    ? GridView.count(
                        crossAxisCount: 1,
                        scrollDirection: Axis.vertical,
                        children: snapshot.data.docs
                            .map(
                              (e) => Card(
                                // ukuran card 100x100
                                elevation: 10.0,
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            133, 205, 253, 1),
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color.fromRGBO(
                                                      60, 132, 171, 1),
                                                  Color.fromRGBO(
                                                      133, 205, 253, 1),
                                                ],
                                              ),
                                            ),
                                            child: Chewie(
                                              controller: ChewieController(
                                                videoPlayerController:
                                                    VideoPlayerController
                                                        .network(e.get('r')),
                                                autoPlay: false,
                                                looping: false,
                                                allowFullScreen: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            // gradient color
                                            decoration: const BoxDecoration(
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
                                                e.get('b'),
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
      ),
    );
  }
}

// // tampilkan video dari asset menggunakan chewie
// class Videos extends StatefulWidget {
//   const Videos({Key? key}) : super(key: key);

//   @override
//   _VideosState createState() => _VideosState();
// }

// class _VideosState extends State<Videos> {
//   FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   late VideoPlayerController videoPlayerController;
//   ChewieController? chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _initPlayer();
//   }

//   void _initPlayer() async {
//     // tampilkan seluruh video dari firebase

//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       looping: true,
//     );
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: chewieController != null
//           ? Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Chewie(
//                 controller: chewieController!,
//               ),
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
