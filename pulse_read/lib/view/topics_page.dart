import 'package:flutter/material.dart';

import '../controller/category_news.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Topics',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          toolbarHeight: 65,
          centerTitle: true,
          elevation: 5,
          backgroundColor: Color.fromRGBO(8, 109, 160, 1),
        ),
        body: Column(
          children: [
            const TabBar(
              isScrollable: true,
              indicatorColor: Color.fromRGBO(7, 34, 57, 1),
              padding: EdgeInsets.only(top: 4),
              labelColor: Color.fromRGBO(8, 109, 160, 1),
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Business'),
                Tab(text: 'Entertainment'),
                Tab(text: 'General'),
                Tab(text: 'Health'),
                Tab(text: 'Science'),
                Tab(text: 'Sports'),
                Tab(text: 'Technology'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                CategoryNews(category: 'business'),
                CategoryNews(category: 'entertainment'),
                CategoryNews(category: 'general'),
                CategoryNews(category: 'health'),
                CategoryNews(category: 'science'),
                CategoryNews(category: 'sports'),
                CategoryNews(category: 'technology'),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
