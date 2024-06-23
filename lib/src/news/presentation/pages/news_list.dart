import 'package:flutter/material.dart';
import 'package:pingolearn/core/common/res/colours.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/newsListPage';

  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColourPallette.backgroundLightColour,
      appBar: AppBar(
        backgroundColor: ColourPallette.backgroundLightColour,
        title: const Text(
          'News List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColourPallette.primaryColour,
          ),
        ),
      ),
    );
  }
}
