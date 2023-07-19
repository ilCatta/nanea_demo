import 'package:flutter/material.dart';
import 'package:nanea_demo/theme/theme.dart';

class LogoNanea extends StatefulWidget {
  bool invertiColori;
  LogoNanea({required this.invertiColori});

  @override
  State<LogoNanea> createState() => _LogoNaneaState();
}

class _LogoNaneaState extends State<LogoNanea> {
  @override
  Widget build(BuildContext context) {
    Color textColor = context.isLight ? Colors.white : Colors.black;

    if (widget.invertiColori) {
      textColor = context.isLight ? Colors.black : Colors.white;
    }

    return Container(
      //color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "nan",
            style: TextStyle(
              fontSize: 45,
              letterSpacing: 1,
              color: textColor,
            ),
          ),
          _letteraE(),
          Text(
            "a",
            style: TextStyle(
              fontSize: 45,
              letterSpacing: 1,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _letteraE() {
    Color letterColor = context.isLight ? Colors.black : Colors.white;
    if (widget.invertiColori) {
      letterColor = context.isLight ? Colors.white : Colors.black;
    }
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 7),
      width: 22,
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 22,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
              color: letterColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: SizedBox(height: 3.0, width: 2),
          ),
          SizedBox(height: 1),
          Container(
            width: 22,
            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
            decoration: BoxDecoration(
              color: letterColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: SizedBox(height: 3.0, width: 2),
          ),
          SizedBox(height: 1),
          Container(
            width: 22,
            margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
            decoration: BoxDecoration(
              color: letterColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: SizedBox(height: 3.0, width: 2),
          ),
        ],
      ),
    );
  }
}
