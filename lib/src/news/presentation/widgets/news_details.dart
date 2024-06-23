import 'package:flutter/material.dart';
import 'package:pingolearn/core/common/res/colours.dart';
import 'package:pingolearn/src/news/data/models/news_model.dart';

class NewsListTile extends StatefulWidget {
  final NewsModel newsModel;
  const NewsListTile({required this.newsModel, super.key});

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  int lengthToShow = 4;

  @override
  void initState() {
    lengthToShow = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Colors.white,
      // tileColor: ,
      onTap: () {
        if (lengthToShow == 4) {
          lengthToShow = 1000;
        } else {
          lengthToShow = 4;
        }
        setState(() {
          lengthToShow;
        });
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: const Text(
          'A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Name: ',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: widget.newsModel.name,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  // children: [],
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Email: ',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                  text: widget.newsModel.email,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  // children: [],
                )
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(
        '${widget.newsModel.body} ',
        overflow: TextOverflow.ellipsis,
        maxLines: lengthToShow,
        style: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}
