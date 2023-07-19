import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nanea_demo/pages/splash_page.dart';
import 'package:nanea_demo/theme/theme.dart';

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  App({this.savedThemeMode});

  // GoRouter configuration
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: Themes.light,
      dark: Themes.dark,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        title: 'Nanea',
        showPerformanceOverlay: false,
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
