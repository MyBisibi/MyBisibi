// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
    @required this.nextQuestion,
    @required this.isLastQuestion,
  }) : super(key: key);

  final VoidCallback nextQuestion;
  final bool isLastQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(85, 111, 181, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          isLastQuestion ? 'Selesai' : 'Berikutnya',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(248, 240, 223, 1),
          ),
        ),
      ),
    );
  }
}
