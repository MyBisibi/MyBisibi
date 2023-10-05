// ignore_for_file: avoid_function_literals_in_foreach_calls

class Question {
  String id;
  String image;
  String title;
  Map<String, bool> options;

  Question({this.id, this.image, this.title, this.options});

  void shuffleOptions() {
    List optionKeys = options.keys.toList();
    optionKeys.shuffle();
    Map<String, bool> shuffledOptions = {};
    optionKeys.forEach((key) {
      shuffledOptions[key] = options[key];
    });
    options = shuffledOptions;
  }
}
