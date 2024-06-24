import 'package:flutter/material.dart';
import 'package:pingolearn/core/common/res/colours.dart';
import 'package:pingolearn/src/news/data/models/news_model.dart';

class NewsListTile extends StatefulWidget {
  final NewsModel newsModel;
  final bool isEmailMasked;
  const NewsListTile({
    required this.newsModel,
    this.isEmailMasked = false,
    super.key,
  });

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

  String maskEmail(String email, bool shouldMask) {
  if (!shouldMask || email.isEmpty) {
    return email;
  }

  // Split the email into local part and domain part
  final parts = email.split('@');
  if (parts.length != 2) {
    // If email is not valid, return it as is
    return email;
  }

  final localPart = parts[0];
  final domainPart = parts[1];

  if (localPart.length <= 3) {
    // If the local part is 3 characters or less, mask the whole local part
    return localPart.replaceAll(RegExp(r'.'), '*') + '@' + domainPart;
  }

  // Mask the local part except for the first 3 characters
  final maskedLocalPart = localPart.substring(0, 3) + '*' * (localPart.length - 3);
  return maskedLocalPart + '@' + domainPart;
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
                  text: maskEmail(widget.newsModel.email, widget.isEmailMasked),
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
