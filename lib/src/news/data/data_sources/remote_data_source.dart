import 'dart:convert';

import 'package:pingolearn/core/errors/exceptions.dart';
import 'package:pingolearn/src/news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsListRemoteDataSourceImpl {
  NewsListRemoteDataSourceImpl();

  Future<List<NewsModel>> getNewsList() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((comment) => NewsModel.fromJson(comment))
            .toList();
      } else {
        throw ServerException(message: 'Failed to Parse data.', statusCode: 400);
      }
    } catch (e) {
      throw ServerException(message: 'Failed to load data.', statusCode: 400);
    }
  }
}
