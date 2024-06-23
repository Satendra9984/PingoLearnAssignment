import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/core/common/views/page_under_construction.dart';
import 'package:pingolearn/src/auth/presentation/pages/login_page.dart';
import 'package:pingolearn/src/auth/presentation/pages/signup_page.dart';
import 'package:pingolearn/src/news/presentation/pages/news_list.dart';
import 'package:pingolearn/src/onboarding/presentation/pages/onboarding_home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  debugPrint('[log] : routeName: ${settings.name}');
  switch (settings.name) {
    case '/' :
      {
        debugPrint('[log] : routeName: ${settings.name} loginpage');

        return _pageRouteBuilder(
          (_) => const LoginPage(),
          settings: settings,
        );
      }
    case '/onboardingPage':
      {
        debugPrint('[log] : routeName: ${settings.name}, matched onboarding ');

        return _pageRouteBuilder(
          (_) => const OnBoardingHomePage(),
          settings: settings,
        );
      }
    
    case SignUpPage.routeName:
      {
        debugPrint('[log] : routeName: ${settings.name} signup page');

        return _pageRouteBuilder(
          (_) => const SignUpPage(),
          settings: settings,
        );
      }
    case NewsListPage.routeName:
      {
        debugPrint('[log] : routeName: ${settings.name} newslistpage');

        return _pageRouteBuilder(
          (_) => const NewsListPage(),
          settings: settings,
        );
      }
    default:
      {
        return _pageRouteBuilder(
          (_) => const PageUnderConstructionPage(),
          settings: settings,
        );
      }
  }
}

PageRouteBuilder<dynamic> _pageRouteBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (context, _, __) {
      return page(context);
    },
  );
}
