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
              LogoNanea(),
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
                    )
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
        padding: EdgeInsets.fromLTRB(30, 6, 30, 12),
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
              count: 2,
              effect: ColorTransitionEffect(
                activeDotColor: Colors.grey.shade600.withOpacity(0.7),
                dotColor: Colors.white,
                spacing: 8.0,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            Container(),
          ],
        ),
      );
}
