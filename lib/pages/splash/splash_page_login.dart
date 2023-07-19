import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SlashPageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        _titolo(),
        _descrizione(),
        SizedBox(height: 30),
        _containerLogin(
          text: "Accedi con Google",
          bgColor: Colors.black,
        ),
        SizedBox(height: 20),
        _containerLogin(
          text: "Accedi con Apple",
          bgColor: Colors.white,
        ),
        SizedBox(height: 30),
        Text(
          "Continua senza effettuare il login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        )
      ]),
    );
  }

  Widget _titolo() => Padding(
        padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 33,
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
            "Ora che sai delle nsotre fantastiche funzioni, crea il tuo account per salvare i tuoi dati e averli sincronizzati su tutti i tuoi dispositivi!",
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

  Widget _containerLogin({
    required String text,
    required Color bgColor,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: bgColor == Colors.black ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
