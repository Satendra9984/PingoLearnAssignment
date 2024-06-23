import 'dart:js_interop_unsafe';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn/core/common/res/colours.dart';
import 'package:pingolearn/core/services/firebase_remote_config.dart';
import 'package:pingolearn/src/news/presentation/cubit/news_cubit.dart';
import 'package:pingolearn/src/news/presentation/models/loading_state.dart';
import 'package:pingolearn/src/news/presentation/widgets/news_details.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/newsListPage';

  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    context.read<NewsCubit>().getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourPallette.backgroundLightColour,
      appBar: AppBar(
        backgroundColor: ColourPallette.primaryColour,
        title: const Text(
          'Comments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (ctx, state) {
          debugPrint('[log] : listening newstate $state');
        },
        builder: (ctx, state) {
          if (state.loadingStates == LoadingStates.loading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(
                    backgroundColor: ColourPallette.primaryColour,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Fetching Latest News...',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.loadingStates == LoadingStates.erroLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_outlined,
                    size: 100,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => context.read<NewsCubit>().getNewsList(),
                    child: const Text(
                      'Click To Fetch News Again.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (ctx, index) {
                var news = state.newsList[index];

                String maskedEmail = FirebaseRemoteConfigService()
                    .getString(FirebaseRemoteConfigService.mask_email);

                debugPrint('[log] : maskedmail ${maskedEmail}');

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: NewsListTile(
                    newsModel: news,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
