import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/abc_bloc.dart';

class ItemsAbc extends StatefulWidget {
  final Map<String, dynamic> abcItemsData;

  ItemsAbc({super.key, required this.abcItemsData});

  @override
  State<ItemsAbc> createState() => _ItemsAbcState();
}

class _ItemsAbcState extends State<ItemsAbc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbcBloc, AbcState>(listener: (context, state) {
      if (state is AbcSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Agregando a favoritos...",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ));
      } else if (state is AbcErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Ya existe la cancion en favoritos..."),
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
                        title: Text(widget.abcItemsData["title"]),
                        content: Column(
                          children: [
                            Image.network(
                              widget.abcItemsData["image"],
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(widget.abcItemsData["description"]),
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
                                BlocProvider.of<AbcBloc>(context).add(
                                    OnAddToFavorites(
                                        infoAboutItem: widget.abcItemsData));
                                BlocProvider.of<AbcBloc>(context)
                                    .add(OnGetAbc());
                              },
                              child: Text("Agregar a favoritos"))
                        ],
                      ));
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    widget.abcItemsData["image"],
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
                          widget.abcItemsData["title"],
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
