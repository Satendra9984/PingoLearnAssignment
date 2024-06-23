import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/core/common/views/page_under_construction.dart';
import 'package:pingolearn/src/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:pingolearn/src/auth/data/repositories/auth_repo_impl.dart';
import 'package:pingolearn/src/auth/presentation/cubit/authentication_cubit.dart';
import 'package:pingolearn/src/auth/presentation/pages/login_page.dart';
import 'package:pingolearn/src/auth/presentation/pages/signup_page.dart';
import 'package:pingolearn/src/news/presentation/pages/news_list.dart';
import 'package:pingolearn/src/onboarding/data/data_sources/local_data_source_imple.dart';
import 'package:pingolearn/src/onboarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:pingolearn/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:pingolearn/src/onboarding/presentation/pages/onboarding_home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingHomePage.routeName:
      {
        return _pageRouteBuilder(
          (_) => const LoginPage(),
          settings: settings,
        );
      }
    case LoginPage.routeName:
      {
        return _pageRouteBuilder(
          (_) => const LoginPage(),
          settings: settings,
        );
      }
    case SignUpPage.routeName:
      {
        return _pageRouteBuilder(
          (_) => const SignUpPage(),
          settings: settings,
        );
      }
    case NewsListPage.routeName:
      {
        return _pageRouteBuilder(
          (_) => const LoginPage(),
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
