import 'package:flutter/material.dart';

import '../view/search_results_page.dart';


class NewsSearch extends SearchDelegate<String> {

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(8, 109, 160, 1), // Vibrant blue
        foregroundColor: Colors.white,
        toolbarHeight: 60,
      ),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints.loose(
            const Size.fromWidth(double.maxFinite)
        ),
        hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.all(10),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromRGBO(8, 109, 160, 0.5), // Lighter vibrant blue
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromRGBO(7, 34, 57, 1), // Dark navy
            )),
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      splashColor: Colors.white,
      splashRadius: 25,
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        splashColor: Colors.white,
        splashRadius: 25,
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          }
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = matchQuery[index];
            showResults(context);
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  matchQuery[index],
                  style: const TextStyle(fontSize: 18),
                  softWrap: true,
                  maxLines: 5,
                ),
              ),
              IconButton(
                onPressed: () {
                  query = matchQuery[index];
                },
                icon: const Icon(Icons.arrow_forward_rounded),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    query.trim();
    if (query.isNotEmpty) {
      return SearchResultsPage(searchTerm: '"$query"');
    } else {
      return const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.search), Text('No Results.')],
        ),
      );
    }
  }
}
