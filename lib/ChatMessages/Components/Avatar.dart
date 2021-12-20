import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar(
      {Key? key,
      this.name = '',
      required this.textColor,
      required this.background})
      : super(key: key);

  final String name;
  Color textColor;
  Color background;

  final Map<String, Color> botAvatarConfig = {
    'color': Colors.white,
    'background': Colors.orange[500]!
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: CircleAvatar(
            backgroundColor: botAvatarConfig['background'],
            child: Text(
              name[0],
              style: TextStyle(
                  color: botAvatarConfig['color'], fontWeight: FontWeight.bold),
            )));
  }
}
