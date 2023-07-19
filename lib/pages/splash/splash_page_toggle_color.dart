// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanea_demo/theme/theme.dart';

class SlashPageToggleColor extends StatefulWidget {
  void Function() onTap;
  bool isLight;

  SlashPageToggleColor({required this.onTap, required this.isLight});

  @override
  State<SlashPageToggleColor> createState() => _SlashPageToggleColorState();
}

class _SlashPageToggleColorState extends State<SlashPageToggleColor> {
  late bool state;

  @override
  void initState() {
    state = widget.isLight ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: (MediaQuery.of(context).size.height) / 2,
          color: context.isLight ? Colors.white : Colors.black,
          child: Center(
            child: Image.asset(
              context.isLight ? "assets/images/card-1.png" : "assets/images/card-2.png",
              height: 320,
              width: 320,
            ),
          ),
        ),
        _toggleThemeColor(),
      ],
    );
  }

  Widget _toggleThemeColor() => Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Modalità scura",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 20),
            CupertinoSwitch(
              value: state,
              onChanged: (value) {
                setState(
                  () {
                    state = value;
                  },
                );
                context.isLight ? AdaptiveTheme.of(context).setDark() : AdaptiveTheme.of(context).setLight();
              },
              thumbColor: CupertinoColors.white,
              activeColor: CupertinoColors.lightBackgroundGray,
            ),
            SizedBox(width: 20),
            Text(
              "Modalità luce",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
