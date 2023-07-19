// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SlashPageTemplate extends StatelessWidget {
  String imageUrl;
  String title;
  String description;
  void Function() onTap;

  SlashPageTemplate({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            _immagine(),
            _titolo(),
            _descrizione(),
          ],
        ),
      ),
    );
  }

  Widget _immagine() => Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Image.asset(
          imageUrl,
          height: 270,
          width: 270,
        ),
      );

  Widget _titolo() => Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Center(
          child: Text(
            title,
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
            description,
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
