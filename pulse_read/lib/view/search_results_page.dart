import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../controller/news_card.dart';
import '../model/single_article.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key, required this.searchTerm});

  final String searchTerm;

  Future<List<Article>> fetchNews(String search) async {
    var response = await http.get(
      Uri.parse("https://newsapi.org/v2/everything?q=$search&apiKey=3b18a8f57495470aa2ca1ea5205678df"),
    );
    var jsonData = jsonDecode(response.body);
    List<Article> news = [];

    if (jsonData['status'] == 'ok') {
      for (var element in jsonData['articles']) {
        if (element['title'] != null && element['urlToImage'] != null) {
          final article = Article(
            name: element['source']['name'] ?? 'Unknown Source',
            title: element['title'] ?? 'No Title',
            url: element['url'] ?? 'url',
            urlToImage: element['urlToImage'] ?? 'image',
            publishedAt: element['publishedAt'] ?? 'Not Available',
          );
          news.add(article);
        }
      }
    }
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: fetchNews(searchTerm),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(8, 109, 160, 1),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
                return NewsCard(
                  source: article.name,
                  title: article.title,
                  url: article.url,
                  imageUrl: article.urlToImage,
                  publishedAt: article.publishedAt,
                );
              },
            );
          } else {
            return const Center(
              child: Text('No results found'),
            );
          }
        },
      ),
    );
  }
}
