import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/core/common/res/colours.dart';
import 'package:pingolearn/core/services/firebase_remote_config.dart';
import 'package:pingolearn/firebase_options.dart';
import 'package:pingolearn/src/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:pingolearn/src/auth/data/repositories/auth_repo_impl.dart';
import 'package:pingolearn/src/auth/presentation/cubit/authentication_cubit.dart';
import 'package:pingolearn/src/auth/presentation/pages/login_page.dart';
import 'package:pingolearn/src/news/data/data_sources/remote_data_source.dart';
import 'package:pingolearn/src/news/data/repos/news_repo_impl.dart';
import 'package:pingolearn/src/news/presentation/cubit/news_cubit.dart';
import 'package:pingolearn/src/onboarding/data/data_sources/local_data_source_imple.dart';
import 'package:pingolearn/src/onboarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:pingolearn/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:pingolearn/src/onboarding/presentation/pages/onboarding_home.dart';

/// Before you can use the hive, you need to initialize it.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   await FirebaseRemoteConfigService().initialize();

  /// running the app
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardCubit(
            onBoardingRepoImpl: OnBoardingRepoImpl(
              localDataSourceImpl: LocalDataSourceImpl(
                auth: FirebaseAuth.instance,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(
            authRepositoryImpl: AuthRepositoryImpl(
              authRemoteDataSourcesImpl: AuthRemoteDataSourcesImpl(
                auth: FirebaseAuth.instance,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => NewsCubit(
            newsRepoImpl: NewsRepoImpl(
              newsListRemoteDataSourceImpl: NewsListRemoteDataSourceImpl(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'PingoLearn',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColourPallette.primaryColour),
        ),

        home: const OnBoardingHomePage(),
        // home: const LoginPage(),
        // onGenerateRoute: generateRoute,
      ),
    );
  }
}
