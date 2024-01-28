import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../view/home_page.dart';
import '../view/regions_news_page.dart';
import '../view/topics_page.dart';


class PulseNavPage extends StatefulWidget {
  const PulseNavPage({super.key});

  @override
  State<PulseNavPage> createState() => _PulseNavPageState();
}

class _PulseNavPageState extends State<PulseNavPage> {
  final List<Widget> _pages = [
    HomePage(defaultCountryCode: 'us'), // Default to US news
    RegionsNewsPage(), // Region-based news page
    TopicsPage(), // Topic list page
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(7, 34, 57, 1), // Dark navy background
          borderRadius: BorderRadius.circular(25), // Rounded corners for the navbar
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GNav(
            rippleColor: Colors.grey[300]!, // Effect color
            hoverColor: Colors.grey[100]!, // Hover color
            gap: 8,
            activeColor: Color.fromRGBO(8, 109, 160, 1), // Active item color
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400), // Animation duration
            tabBackgroundColor: Colors.grey[50]!, // Active background color
            color: Colors.white, // Inactive icon color
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                margin: EdgeInsets.all(5), // Adding margin around the GButton
              ),
              GButton(
                icon: Icons.public,
                text: 'Regions',
                margin: EdgeInsets.all(5), // Adding margin around the GButton
              ),
              GButton(
                icon: Icons.category,
                text: 'Topics',
                margin: EdgeInsets.all(5), // Adding margin around the GButton
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
