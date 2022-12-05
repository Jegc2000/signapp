import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<OnGetFavorites>(_getFavorite);
    on<OnRemove>(_removeFavorite);
  }

  FutureOr<void> _getFavorite(OnGetFavorites event, Emitter emit) async {
    emit(FavoritesLoadingState());
    try {
      //Usuario
      var user = await FirebaseFirestore.instance
          .collection("users")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");

      //Coleccion de favoritos
      var docsRefs = await user.get();
      List<dynamic> listIds = docsRefs.data()?["favorites"] ?? [];

      //Mandar la informacion
      emit(FavoritesSuccessState(userFavorites: listIds));
    } catch (e) {
      print("Error al obtener los favoritos: $e");
      emit(FavoritesErrorState());
    }
  }

  FutureOr<void> _removeFavorite(OnRemove event, Emitter emit) async {
    try {
      //guardar info
      Map<String, dynamic> requiredFavoritesInfo = {
        "title": event.toRemoveInfo["title"].toString(),
        "description": event.toRemoveInfo["description"].toString(),
        "image": event.toRemoveInfo["image"].toString(),
      };

      var user = await FirebaseFirestore.instance
          .collection("users")
          .doc("${FirebaseAuth.instance.currentUser!.uid}")
          .get();

      List<dynamic> userFavorites = user.data()?["favorites"];

      //Revisar si la cancion ya esta en la lista
      for (var favorite in userFavorites) {
        if (mapEquals(favorite, requiredFavoritesInfo)) {

          FirebaseFirestore.instance
          .collection("users")
          .doc("${FirebaseAuth.instance.currentUser!.uid}").update({
            "favorites":
            FieldValue.arrayRemove([favorite]),
          });

          FirebaseFirestore.instance
          .collection("users")
          .doc("${FirebaseAuth.instance.currentUser!.uid}").update({
          });
        }
      }

      emit(FavoritesRemoveSuccessState());
    } catch (e) {
      print("Error al intentar borrar el item: $e");
      return;
    }
  }
}