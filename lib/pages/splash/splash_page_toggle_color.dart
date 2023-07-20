// ignore_for_file: must_be_immutable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height) / 2,
                  //padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  color: context.isLight ? Colors.white : Colors.black,
                  child: Center(
                    child: SizedBox(height: 190, child: _cardExample()),
                  ),
                ),
              ],
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
            margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: context.isLight ? Colors.grey.shade300 : Colors.grey.shade700,
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
                _contenutoCard(),
              ],
            ),
          ),
          Positioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.grey.shade300,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Center(
                    child: Image.asset("assets/images/logo-no-bg.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _contenutoCard() => Container(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nanea Restaurant",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _contenutoCardIcon(EvaIcons.menu2),
              ],
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Burger | Pasta | Pizza",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                _contenutoCardIcon(EvaIcons.shoppingBag),
              ],
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffF2B70D),
                  radius: 9,
                  child: Center(
                    child: Text(
                      "i",
                      style: TextStyle(
                        fontSize: 11,
                        color: context.isLight ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                _contenutoCardIcon(FontAwesomeIcons.utensils),
              ],
            ),
          ],
        ),
      );

  Widget _contenutoCardIcon(IconData icon) => Stack(
        children: [
          Icon(
            icon,
            size: 22,
            color: context.isLight ? Colors.grey.shade600 : Colors.white,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: Colors.green.shade300,
                shape: BoxShape.circle,
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
