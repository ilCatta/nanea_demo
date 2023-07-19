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
                child: _cardExample(),
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

  Widget _cardExample() => Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  child: Image.asset(
                    "assets/images/bg-card.png",
                    height: 70,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: -30,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 24,
              ),
            ),
          ),
        ],
      );

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
