import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key key,
    @required this.options,
    @required this.color,
  }) : super(key: key);

  final String options;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 7.0,
        color: color,
        child: ListTile(
          contentPadding: const EdgeInsets.all(2.0),
          title: Text(options,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: color.red != color.green
                    ? const Color.fromRGBO(248, 240, 223, 1)
                    : Colors.black,
              )),
        ));
  }
}
