import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar(
      {Key? key,
      required this.name,
      required this.textColor,
      required this.background})
      : super(key: key);

  final String name;
  Color textColor;
  Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: CircleAvatar(
            backgroundColor: background,
            child: Text(
              name[0],
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            )));
  }
}
