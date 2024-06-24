import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/core/common/res/colours.dart';
import 'package:pingolearn/src/auth/presentation/cubit/authentication_cubit.dart';
import 'package:pingolearn/src/auth/presentation/models/auth_states_enum.dart';
import 'package:pingolearn/src/auth/presentation/pages/signup_page.dart';
import 'package:pingolearn/src/auth/presentation/widgets/custom_button.dart';
import 'package:pingolearn/src/auth/presentation/widgets/custom_textfield.dart';
import 'package:pingolearn/src/news/presentation/pages/news_list.dart';

class LoginPage extends StatefulWidget {
  // static const routeName = '/login';

  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    context.read<AuthenticationCubit>().checkIfLoggedIn();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm(AuthenticationCubit authenticationCubit) {
    if (_formKey.currentState!.validate()) {
      authenticationCubit.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var gap = 24.0;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColourPallette.backgroundLightColour,
      appBar: AppBar(
        backgroundColor: ColourPallette.backgroundLightColour,
        title: const Text(
          'Comments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColourPallette.primaryColour,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: size.height - 32 - 50,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: gap - 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    SizedBox(height: gap),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      validator: _validatePassword,
                    ),
                    SizedBox(height: gap),
                  ],
                ),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    debugPrint('[log] : authstate ${state.authenticationStates}');

                    // if(state.onBoardingStates == OnBoardingStates.)

                    if (state.authenticationStates ==
                        AuthenticationStates.signedIn) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const NewsListPage(),
                        ),
                      );
                    }

                    if (state.authenticationStates ==
                        AuthenticationStates.errorSigningIn) {
                      // [TODO] : ScaffoldMessenger
                    }
                  },
                  builder: (context, state) {
                    var authcubit = context.read<AuthenticationCubit>();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          child: CustomElevatedButton(
                            text: 'Login',
                            onPressed: () {
                              _submitForm(authcubit);
                            },
                            fontSize: 16.0,
                            icon: state.authenticationStates ==
                                    AuthenticationStates.signingIn
                                ? const CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(height: gap - 6),
                        RichText(
                          text: TextSpan(
                            text: ' New here? ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: const TextStyle(
                                  color: ColourPallette.primaryColour,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (state.authenticationStates ==
                                        AuthenticationStates.signingIn) {
                                      return;
                                    }
                                    // debugPrint('[log] : tapping SignUp');

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => const SignUpPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: gap),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
