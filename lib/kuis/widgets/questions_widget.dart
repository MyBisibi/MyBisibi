// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_bisibi/kuis/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key key,
    @required this.question,
    @required this.questionImage,
    @required this.indexAction,
    @required this.totalQuestions,
    @required this.isLastQuestion,
  }) : super(key: key);

  final String question;
  final String questionImage;
  final int indexAction;
  final int totalQuestions;
  final bool isLastQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            alignment: Alignment.center,
            child: Text(
              '${indexAction + 1}/$totalQuestions: $question',
              style: const TextStyle(fontSize: 24, color: neutral),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 200,
              height: 200,
              child: Image.network(
                questionImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
