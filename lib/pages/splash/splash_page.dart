import 'package:flutter/material.dart';
import 'package:nanea_demo/pages/splash/splash_page_toggle_color.dart';
import 'package:nanea_demo/pages/splash/splash_page_login.dart';
import 'package:nanea_demo/pages/splash/slash_page_template.dart';
import 'package:nanea_demo/theme/theme.dart';
import 'package:nanea_demo/widgets/logo_nanea.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex != 4) {
      setState(() {
        currentIndex++;
        _controller.animateToPage(currentIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
      });
    }
  }

  void goToFinalPage() {
    while (currentIndex < 4) {
      setState(() {
        currentIndex++;
        _controller.animateToPage(currentIndex, duration: Duration(milliseconds: 500), curve: Curves.linear);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2B70D),
      body: _body(),
    );
  }

  Widget _body() => SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      children: [
                        SlashPageTemplate(
                          imageUrl: "assets/images/image-1.png",
                          title: "Consegna",
                          description: "Fai il tuo ordine online e fattelo consegnare...",
                          onTap: nextPage,
                        ),
                        SlashPageTemplate(
                          imageUrl: "assets/images/image-2.png",
                          title: "Take Away",
                          description: "...oppure ordina nell'app e poi ritiralo tu stesso...",
                          onTap: nextPage,
                        ),
                        SlashPageTemplate(
                          imageUrl: "assets/images/image-3.png",
                          title: "Sul posto",
                          description:
                              "...puoi trovare i nostri codidi QR diretamente sui tavoli dei locali che usano nanea. Basta eseguire la scansione del codice QR e fare il tuo ordine per riceverlo!",
                          onTap: nextPage,
                        ),
                        SlashPageToggleColor(
                          onTap: nextPage,
                          isLight: context.isLight,
                        ),
                        SlashPageLogin(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LogoNanea(invertiColori: currentIndex != 3 ? false : true),
                      ],
                    ),
                  ],
                ),
              ),
              _menuBottom(),
            ],
          ),
        ),
      );

  Widget _menuBottom() => Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 6, 30, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: currentIndex != 4,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: GestureDetector(
                onTap: goToFinalPage,
                child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Salta",
                    style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: ColorTransitionEffect(
                  activeDotColor: Colors.grey.shade600.withOpacity(0.7),
                  dotColor: Colors.white,
                  spacing: 16.0,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
            Visibility(
              visible: currentIndex != 4,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: GestureDetector(
                onTap: nextPage,
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade100.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    "Continuare",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
