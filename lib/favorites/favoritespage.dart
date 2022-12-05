import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../items.dart';
import 'bloc/favorites_bloc.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _AbcPageState();
}

class _AbcPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is FavoritesSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Favorites"),
              ),
              body: Container(
                padding: EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: state.userFavorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Items(itemsData: state.userFavorites[index]);
                  },
                ),
              ),
            );
          } else if (state is FavoritesLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("Error"));
          }
        });
  }
}
