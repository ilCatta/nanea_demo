import 'package:flutter/material.dart';
import 'package:nanea_demo/theme/theme.dart';

class LogoNanea extends StatefulWidget {
  const LogoNanea({super.key});

  @override
  State<LogoNanea> createState() => _LogoNaneaState();
}

class _LogoNaneaState extends State<LogoNanea> {
  @override
  Widget build(BuildContext context) {
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
              color: Colors.black,
            ),
          ),
          _letteraE(),
          Text(
            "a",
            style: TextStyle(
              fontSize: 45,
              letterSpacing: 1,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _letteraE() => Container(
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: SizedBox(height: 3.0, width: 2),
            ),
            SizedBox(height: 1),
            Container(
              width: 22,
              margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
              decoration: BoxDecoration(
                color: context.isLight ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: SizedBox(height: 3.0, width: 2),
            ),
            SizedBox(height: 1),
            Container(
              width: 22,
              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
              child: SizedBox(height: 3.0, width: 2),
            ),
          ],
        ),
      );
}
