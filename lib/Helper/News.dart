import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/AricleModel.dart';

class News {
  List<AricleModel> news = [];

  Future<void> getNews() async {
    String url =
        ("https://newsapi.org/v2/top-headlines?country=eg&apiKey=a1a46fbb793c4460a124588251aeab24");
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          AricleModel aricleModel = AricleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(aricleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<AricleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        ("https://newsapi.org/v2/top-headlines?category=$category&country=eg&apiKey=a1a46fbb793c4460a124588251aeab24");
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          AricleModel aricleModel = AricleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(aricleModel);
        }
      });
    }
  }
}
