// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
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
            _titolo(),
            _descrizione(),
          ],
        ),
      ),
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

  Widget _titolo() => Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Center(
          child: Text(
            "Vista",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _descrizione() => Padding(
        padding: EdgeInsets.fromLTRB(20, 28, 20, 0),
        child: Center(
          child: AutoSizeText(
            "Puoi fare il tuo ordine in modalità luce o modalità scura, come preferisci!",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            minFontSize: 14,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      );
}
