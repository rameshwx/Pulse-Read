import 'package:flutter/material.dart';

import '../controller/country_headlines.dart';

class RegionsNewsPage extends StatelessWidget {
  const RegionsNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Global Pulse', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
          centerTitle: true,
          toolbarHeight: 65,
          backgroundColor: Color.fromRGBO(8, 109, 160, 1),
          elevation: 5.0,
          shadowColor: Colors.black45,
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
                Tab(text: 'India'),
                Tab(text: 'Australia'),
                Tab(text: 'Singapore'),
                Tab(text: 'UAE'),
                Tab(text: 'Canada'),
                Tab(text: 'England'),
                Tab(text: 'Russia'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CountryHeadlines(countryCode: 'in'),
                  CountryHeadlines(countryCode: 'au'),
                  CountryHeadlines(countryCode: 'sg'),
                  CountryHeadlines(countryCode: 'ae'),
                  CountryHeadlines(countryCode: 'ca'),
                  CountryHeadlines(countryCode: 'gb'),
                  CountryHeadlines(countryCode: 'ru'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
