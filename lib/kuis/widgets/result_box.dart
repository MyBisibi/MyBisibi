// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:my_bisibi/kuis/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key key,
    @required this.result,
    @required this.questionLength,
    @required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilai kamu ',
              style: TextStyle(
                color: Color.fromRGBO(0, 56, 101, 1),
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(
                    fontSize: 30.0, color: Color.fromRGBO(248, 240, 223, 1)),
              ),
              radius: 50.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
                result == questionLength / 2
                    ? "Kamu lulus, tapi masih ada banyak yang harus kamu pelajari"
                    : result < questionLength / 2
                        ? "Kamu belum lulus, tapi kamu bisa lebih baik lagi"
                        : "Kamu lulus, kamu sudah menguasai materi ini",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 56, 101, 1),
                  fontSize: 20.0,
                )),
            const SizedBox(height: 25.0),
            Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 0, 140, 255)),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    'Coba Lagi',
                    style: TextStyle(
                      color: Color.fromRGBO(248, 240, 223, 1),
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                // kembali ke menu utama
                const SizedBox(height: 20.0),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 0, 140, 255)),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Kembali ke Menu Utama',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(248, 240, 223, 1),
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
