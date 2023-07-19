import 'package:flutter/material.dart';
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
              LogoNanea(invertiColori: false),
              Expanded(
                child: PageView(
                  controller: _controller,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.purple,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
              _menuBottom(),

              // pageview
            ],
          ),
        ),
      );

  Widget _menuBottom() => Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(50, 6, 30, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Salta",
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: ColorTransitionEffect(
                activeDotColor: Colors.grey.shade600.withOpacity(0.7),
                dotColor: Colors.white,
                spacing: 8.0,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade100.withOpacity(0.3),
                ),
              ),
              child: Text("Continuare"),
            ),
          ],
        ),
      );
}
