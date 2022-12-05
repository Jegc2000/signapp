part of 'abc_bloc.dart';

abstract class AbcState extends Equatable {
  const AbcState();
  
  @override
  List<Object> get props => [];
}

class AbcInitial extends AbcState {}

class AbcLoadingState extends AbcState{}

class AbcSuccessState extends AbcState{
  final List<dynamic> Abc;

  AbcSuccessState({required this.Abc});

  @override
  List<Object> get props => [Abc];
}

class AbcErrorState extends AbcState{}

class AbcUploadingState extends AbcState{}