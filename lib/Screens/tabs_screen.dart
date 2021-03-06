import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorite',},
  ];

  int _seletedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _seletedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_seletedPageIndex]['title']), 
          ),
          drawer: MainDrawer(),
          body: _pages[_seletedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _seletedPageIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category), 
                title: Text('Categorirs'),
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category), 
                title: Text('Favoriter'),
              ),
            ],
          ),  
        );
        
  }
}