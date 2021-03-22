import 'package:bb_cocktail/ui/discovery/discovery_page.dart';
import 'package:bb_cocktail/ui/search/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildTabStack(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.liquor),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          currentIndex: _selectedTab,
          selectedItemColor: Colors.amber[800],
          backgroundColor: Color.fromARGB(255, 32, 33, 33),
          unselectedItemColor: Colors.white70,
          onTap: _onItemTapped,
        ),
      );

  Widget _buildTabStack() => IndexedStack(
      index: _selectedTab,
      children: <Widget>[
        DiscoveryPage(),
        SearchPage(),
        Text(
          'Index 2: School',
        ),
      ],
    );
}
