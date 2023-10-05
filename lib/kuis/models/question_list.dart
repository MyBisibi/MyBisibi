// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:my_bisibi/kuis/models/question_model.dart';

class QuestionList {
  // ignore: prefer_final_fields
  List<Question> _questions = [
    Question(
      id: '1',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FA.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'A': true, 'B': false, 'C': false, 'D': false},
    ),
    Question(
      id: '2',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FB.png?alt=media&token=21f263d5-70fb-4839-b8d7-ee6784127164',
      title: 'Huruf Apakah Ini?',
      options: {'D': false, 'G': false, 'B': true, 'X': false},
    ),
    Question(
      id: '3',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FC.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'J': false, 'K': false, 'C': true, 'D': false},
    ),
    Question(
      id: '4',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FD.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'U': false, 'D': true, 'C': false, 'L': false},
    ),
    Question(
      id: '5',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FE.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'E': true, 'Z': false, 'D': false, 'O': false},
    ),
    Question(
      id: '6',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FF.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'L': false, 'Z': false, 'F': true, 'P': false},
    ),
    Question(
      id: '7',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FG.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'K': false, 'G': true, 'D': false, 'A': false},
    ),
    Question(
      id: '8',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FH.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'X': false, 'H': true, 'J': false, 'L': false},
    ),
    Question(
      id: '9',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FI.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'I': true, 'L': false, 'J': false, 'P': false},
    ),
    Question(
      id: '10',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FJ.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'J': true, 'I': false, 'K': false, 'L': false},
    ),
    Question(
      id: '11',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FK.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'L': false, 'J': false, 'K': true, 'M': false},
    ),
    Question(
      id: '12',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FL.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'L': true, 'K': false, 'M': false, 'N': false},
    ),
    Question(
      id: '13',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FM.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'N': false, 'M': true, 'L': false, 'O': false},
    ),
    Question(
      id: '14',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FN.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'O': false, 'N': true, 'M': false, 'P': false},
    ),
    Question(
      id: '15',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FO.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'P': false, 'O': true, 'N': false, 'Q': false},
    ),
    Question(
      id: '16',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FP.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'Q': false, 'P': true, 'O': false, 'R': false},
    ),
    Question(
      id: '17',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FQ.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'R': false, 'Q': true, 'P': false, 'S': false},
    ),
    Question(
      id: '18',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FR.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'S': false, 'R': true, 'Q': false, 'T': false},
    ),
    Question(
      id: '19',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FS.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'A': false, 'R': false, 'S': true, 'Q': false},
    ),
    Question(
      id: '20',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FT.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'T': true, 'S': false, 'R': false, 'Q': false},
    ),
    Question(
      id: '21',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FU.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'U': true, 'Y': false, 'R': false, 'Q': false},
    ),
    Question(
      id: '22',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FV.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'V': true, 'S': false, 'Z': false, 'Q': false},
    ),
    Question(
      id: '23',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FW.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'W': true, 'Q': false, 'O': false, 'P': false},
    ),
    Question(
      id: '24',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FX.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'X': true, 'Q': false, 'Z': false, 'P': false},
    ),
    Question(
      id: '25',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FY.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'Y': true, 'X': false, 'E': false, 'Q': false},
    ),
    Question(
      id: '26',
      image:
          'https://firebasestorage.googleapis.com/v0/b/mybisibi.appspot.com/o/kamusSIbi%2Fhuruf%2FZ.png?alt=media&token=daabfd8d-5221-40ac-a5db-84d407641c2f',
      title: 'Huruf Apakah Ini?',
      options: {'Z': true, 'Y': false, 'X': false, 'Q': false},
    ),
  ];

  List<Question> get questions {
    _questions.forEach((question) {
      question.shuffleOptions();
    });
    _questions.shuffle();
    return _questions;
  }
}
