import 'package:flutter/material.dart';

import '../controller/country_headlines.dart';
import '../controller/news_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.defaultCountryCode});

  final String defaultCountryCode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          backgroundColor: Color.fromRGBO(8, 109, 160, 1),
          title: const Text(
            'Pulse Read',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          elevation: 5.0,
          shadowColor: Colors.black45,

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: NewsSearch(),
                    );
                  },
                  icon: const Icon(Icons.search_rounded, color: Colors.white)),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {});
          },
          color: Color.fromRGBO(7, 34, 57, 1),
          displacement: 20,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: CountryHeadlines(countryCode: widget.defaultCountryCode),
        )
    );
  }
}
