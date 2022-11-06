import 'package:flutter/material.dart';

import 'items.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _favoritesElements = [
    {
      "title": "A",
      "description": "Letra A",
      "image":
          "https://i.pinimg.com/550x/15/35/4c/15354cf0b58abb4b7f1047efeb240159.jpg",
    },
    {
      "title": "B",
      "description": "Letra B",
      "image":
          "https://i.pinimg.com/originals/df/ab/12/dfab12165ca599ba653bc97b4da2255f.png",
    },
    {
      "title": "C",
      "description": "Letra C",
      "image":
          "https://2.bp.blogspot.com/-ChlvAvZWEjE/WIaTzNxvrKI/AAAAAAAAHGY/oIVQkcpS5D8MCg8LSgp1ODD5pJGBdoX2wCLcB/s1600/Captura%2Bde%2Bpantalla%2B2017-01-17%2B12.18.00.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _favoritesElements.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Items(itemsData: _favoritesElements[index]);
          },
        ),
      ),
    );
  }
}
