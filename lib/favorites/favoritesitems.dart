import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorites_bloc.dart';

class FavoritesItems extends StatefulWidget {
  final Map<String, dynamic> favoriteItemsData;

  FavoritesItems({super.key, required this.favoriteItemsData});

  @override
  State<FavoritesItems> createState() => _FavoritesItemsState();
}

class _FavoritesItemsState extends State<FavoritesItems> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
      if (state is FavoritesSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Removiendo a favoritos...",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ));
      } else if (state is FavoritesErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error al remover de favoritos..."),
        ));
      }
    }, builder: (context, state) {
      return Container(
        width: 150,
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (builder) => AlertDialog(
                        title: Text(widget.favoriteItemsData["title"]),
                        content: Column(
                          children: [
                            Image.network(
                              widget.favoriteItemsData["image"],
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(widget.favoriteItemsData["description"]),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                BlocProvider.of<FavoritesBloc>(context).add(
                                    OnRemove(
                                        toRemoveInfo:
                                            widget.favoriteItemsData));
                                BlocProvider.of<FavoritesBloc>(context)
                                    .add(OnGetFavorites());
                              },
                            child: Text("Quitar de favoritos"))
                        ],
                      ));
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    widget.favoriteItemsData["image"],
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(238, 27, 69, 185),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          widget.favoriteItemsData["title"],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
