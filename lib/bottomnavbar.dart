import 'package:flutter/material.dart';
import 'package:signapp/abcpage.dart';
import 'package:signapp/accountpage.dart';
import 'package:signapp/camarapage.dart';
import 'package:signapp/favoritespage.dart';
import 'package:signapp/lectionspage.dart';

class botomnavbar extends StatefulWidget {
  const botomnavbar({super.key});

  @override
  State<botomnavbar> createState() => _botomnavbarState();
}

class _botomnavbarState extends State<botomnavbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CamaraPage(),
    AbcPage(),
    LectionsPage(),
    FavoritesPage(),
    AccountPage(),
  ];
  void onTappedBar(int index) {
    setState(
      () {
        _currentIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_rounded),
            label: 'Camara',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sort_by_alpha),
            label: 'Abecedario',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Lections',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorito',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
            backgroundColor: Colors.blue,
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 18, 1, 92),
      ),
    );
  }
}
