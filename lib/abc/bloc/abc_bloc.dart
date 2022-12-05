import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
part 'abc_event.dart';
part 'abc_state.dart';

class AbcBloc extends Bloc<AbcEvent, AbcState> {
  AbcBloc() : super(AbcInitial()) {
    on<OnGetAbc>(_getAbc);
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
}