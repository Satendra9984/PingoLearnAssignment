import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/src/auth/presentation/pages/login_page.dart';
import 'package:pingolearn/src/news/presentation/pages/news_list.dart';
import 'package:pingolearn/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:pingolearn/src/onboarding/presentation/models/loading_states.dart';

class OnBoardingHomePage extends StatefulWidget {
  // static const routeName = '/';
  const OnBoardingHomePage({Key? key}) : super(key: key);

  @override
  State<OnBoardingHomePage> createState() => _OnBoardingHomePageState();
}

class _OnBoardingHomePageState extends State<OnBoardingHomePage> {
  @override
  void initState() {
    context.read<OnBoardCubit>().checkIfLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<OnBoardCubit, OnBoardState>(
              listener: (ctx, state) {
                debugPrint('[log] : listening onboarding');
              },
              child: Text('j'),
            ),
            const Text(
              'Pingolearn',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
