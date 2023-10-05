import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bisibi/tampilan_awal.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Inisialisasi Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Don't landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // run application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBisibi',
      theme: ThemeData(
        fontFamily: 'Prompt',
        primarySwatch: Colors.blue,
      ),
      home: tampilanAwal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
