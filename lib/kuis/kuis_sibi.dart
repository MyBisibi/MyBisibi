// ignore_for_file: camel_case_types, library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_bisibi/kuis/constants.dart';
import 'package:my_bisibi/kuis/models/question_model.dart';
import 'package:my_bisibi/kuis/widgets/questions_widget.dart';
import 'package:my_bisibi/kuis/widgets/next_button.dart';
import 'package:my_bisibi/kuis/widgets/option_card.dart';
import 'package:my_bisibi/kuis/widgets/result_box.dart';
import 'package:my_bisibi/kuis/models/question_list.dart';

class kuisSibi extends StatefulWidget {
  const kuisSibi({Key key}) : super(key: key);

  @override
  _kuisSibiState createState() => _kuisSibiState();
}

class _kuisSibiState extends State<kuisSibi> {
  // ignore: prefer_final_fields

  // ambil data dari question_list.dart
  final List<Question> _questions = QuestionList().questions.take(15).toList();

  @override
  void initState() {
    super.initState();
  }

  int index = 0;

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  // ulang kembali soal
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
      _questions.shuffle();
    });
    Navigator.pop(context);
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed == true) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Pilih jawaban terlebih dahulu'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 00.0, horizontal: 50.0),
          ),
        );
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
        // Penambahan kondisi ketika jawaban benar
        if (value == true) {
          score++;
        } else {
          // Penambahan kondisi ketika jawaban salah
          score == score;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // tampilkan popup konfirmasi
          bool shouldClose = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Konfirmasi'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Apakah kamu yakin ingin keluar?'),
                    Text('Jawaban kamu akan hilang semua'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Tidak'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Ya'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );

          // jika pengguna memilih "tidak", jangan keluar dari aplikasi
          return shouldClose;
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(222, 252, 249, 1),
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(222, 252, 249, 1),
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(60, 132, 171, 1),
                            width: 1.0,
                          ),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(133, 205, 253, 1),
                            Color.fromRGBO(222, 252, 249, 1),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/SIBI.png',
                                width: 75,
                                height: 75,
                              ),
                              const Text('KUIS SIBI',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                    color: Color.fromRGBO(54, 47, 217, 1),
                                  )),
                            ],
                          ),
                          // buat Text di kanan layar
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Nilai: $score',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                  color: Color.fromRGBO(54, 47, 217, 1),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          QuestionWidget(
                            indexAction: index,
                            question: _questions[index].title,
                            questionImage: _questions[index].image,
                            totalQuestions: _questions.length,
                            isLastQuestion: false,
                          ),
                          const Divider(
                            height: 40.0,
                            color: neutral,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          for (int i = 0;
                              i < _questions[index].options.length;
                              i++)
                            GestureDetector(
                              onTap: () => checkAnswerAndUpdate(
                                  _questions[index].options.values.toList()[i]),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                width: 400.0,
                                child: OptionCard(
                                  options: _questions[index]
                                      .options
                                      .keys
                                      .toList()[i],
                                  color: isPressed
                                      ? _questions[index]
                                                  .options
                                                  .values
                                                  .toList()[i] ==
                                              true
                                          ? correct
                                          : incorrect
                                      : const Color.fromRGBO(85, 111, 181, 1),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: NextButton(
                  nextQuestion: () => nextQuestion(_questions.length),
                  // jika index == akhir pertanyaan maka isLastQuestion = true
                  isLastQuestion: index == _questions.length - 1 ? true : false,
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
