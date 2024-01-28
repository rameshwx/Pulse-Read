import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/single_article.dart';
import 'news_card.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  const CategoryNews({super.key, required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<Article> categoryNews = [];
  Future<void> getCategoryNews(String requiredCategory) async{
    var response = await http.get(
        Uri.parse("https://newsapi.org/v2/top-headlines?category=$requiredCategory&country=in&apiKey=3b18a8f57495470aa2ca1ea5205678df")
    );
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      for(var element in jsonData['articles']){
        if(element['urlToImage'] != null && element['title'] != null){

          final articleModel = Article(
            name: element['source']['name'] ?? 'name',
            title: element['title'] ?? 'title',
            url: element['url'],
            urlToImage: element['urlToImage'] ?? 'Image',
            publishedAt: element['publishedAt'] ?? 'Time',
          );
          categoryNews.add(articleModel);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getCategoryNews(widget.category),

        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return ListView.builder(
                itemCount: categoryNews.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: NewsCard(
                      source: categoryNews[index].name,
                      title: categoryNews[index].title,
                      url: categoryNews[index].url,
                      imageUrl: categoryNews[index].urlToImage,
                      publishedAt: categoryNews[index].publishedAt,
                    ),
                  );
                }
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(239, 83, 80, 1),),);
          }
        },
      ),
    );
  }
}
