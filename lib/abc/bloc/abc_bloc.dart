import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
part 'abc_event.dart';
part 'abc_state.dart';

class AbcBloc extends Bloc<AbcEvent, AbcState> {
  AbcBloc() : super(AbcInitial()) {
    on<OnGetAbc>(_getAbc);
    on<OnAddToFavorites>(_saveData);
  }

  FutureOr<void> _getAbc(OnGetAbc event, Emitter emit) async {
    emit(AbcLoadingState());
    try {

      var abcdoc = await FirebaseFirestore.instance
          .collection("datos")
          .doc("eCzxZSfIuXYXmlBPySaU");

      //Coleccion de favoritos
      var docsRefs = await abcdoc.get();
      List<dynamic> listIds = docsRefs.data()?["abc"] ?? [];

      //Mandar la informacion
      emit(AbcSuccessState(Abc: listIds));
    } catch (e) {
      print("Error al obtener las letras: $e");
      emit(AbcErrorState());
    }
  }

  FutureOr<void> _saveData(OnAddToFavorites event, Emitter emit) async {
    emit(AbcLoadingState());
    bool _saved = await _saveFavoriteSong(event.infoAboutItem);
    var abcdoc = await FirebaseFirestore.instance
          .collection("datos")
          .doc("eCzxZSfIuXYXmlBPySaU");

      //Coleccion de favoritos
      var docsRefs = await abcdoc.get();
      List<dynamic> listIds = docsRefs.data()?["abc"] ?? [];
    if(_saved) {
      emit(AbcSuccessState(Abc: listIds));
    } else {
      emit(AbcErrorState());
    }
  }

  FutureOr<bool> _saveFavoriteSong(Map<String, dynamic> infoItem) async {
    //Obtener la informacion de la cancion
    Map<String, dynamic> requiredSongInfo = {
      "title": infoItem["title"].toString(),
      "image": infoItem["image"].toString(),
      "description": infoItem["description"].toString(),

    };


    try{
      //Obtener el id del usuario
      var User = await FirebaseFirestore.instance
        .collection("users")
        .doc("${FirebaseAuth.instance.currentUser!.uid}");
      
      //Obtener canciones favoritas del usuario
      var docsRef = await User.get();
      List<dynamic> listIds = docsRef.data()?["favorites"];

      //Revisar si la cancion ya esta en la lista
      for(var item in listIds){
        if(mapEquals(item, requiredSongInfo)){
          return false;
        }
      }

      //Agregar la cancion nueva
      listIds.add(requiredSongInfo);

      await User.update({"favorites": listIds});
      return true;

    }catch(e){
      print("Error en actualizar el documento: $e");
      return false;
    }
  }

}