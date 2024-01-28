import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/single_article.dart';
import 'news_card.dart';


class CountryHeadlines extends StatelessWidget {
  const CountryHeadlines({super.key, required this.countryCode});

  final String countryCode;

  @override
  Widget build(BuildContext context) {
    List<Article> news = [];

    Future<void> getCountryHeadlines(String countryCode) async {
      news.clear();

      var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=3b18a8f57495470aa2ca1ea5205678df"),
      );
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        for (var element in jsonData['articles']) {
          if (element['urlToImage'] != null && element['title'] != null) {
            final articleModel = Article(
              name: element['source']['name'] ?? 'name',
              title: element['title'] ?? 'title',
              url: element['url'],
              urlToImage: element['urlToImage'] ?? 'image',
              publishedAt: element['publishedAt'] ?? 'time',
            );
            news.add(articleModel);
          }
        }
      }
    }

    return FutureBuilder(
        future: getCountryHeadlines(countryCode),
        builder: (context, snapshot) {
          //snapshot use to check current request call status
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  // return blog
                  return NewsCard(
                    source: news[index].name,
                    title: news[index].title,
                    url: news[index].url,
                    imageUrl: news[index].urlToImage,
                    publishedAt: news[index].publishedAt,
                  );
                },
              ),
            );
          }

          else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(239, 83, 80, 1),
              ),
            );
          }
        }
    );
  }
}
