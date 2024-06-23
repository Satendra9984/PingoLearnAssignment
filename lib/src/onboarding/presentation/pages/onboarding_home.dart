import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/src/auth/presentation/pages/login_page.dart';
import 'package:pingolearn/src/auth/presentation/pages/signup_page.dart';
import 'package:pingolearn/src/news/presentation/pages/news_list.dart';
import 'package:pingolearn/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:pingolearn/src/onboarding/presentation/models/loading_states.dart';

class OnBoardingHomePage extends StatefulWidget {
  static const routeName = '/';
  const OnBoardingHomePage({Key? key}) : super(key: key);

  @override
  State<OnBoardingHomePage> createState() => _OnBoardingHomePageState();
}

class _OnBoardingHomePageState extends State<OnBoardingHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubit>().checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listenWhen: (prev, curr) {
          debugPrint('[log] : Listening onboarding $prev');

          debugPrint('[log] : Listening onboarding $curr');

          return true;
        },
        listener: (context, state) {
          debugPrint('[log] : Listening onboarding $state');
          if (state.onBoardingStates == OnBoardingStates.isLoggedIn) {
            Navigator.pushReplacementNamed(context, NewsListPage.routeName);
          }
          if (state.onBoardingStates == OnBoardingStates.notLoggedIn) {
            Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          // debugPrint('[log] : Listening onboarding $state');
          return const Center(
            child: Text('Pingolearn'),
          );
        },
      ),
    );
  }
}
