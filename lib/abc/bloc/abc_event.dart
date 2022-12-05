part of 'abc_bloc.dart';

abstract class AbcEvent extends Equatable {
  const AbcEvent();

  @override
  List<Object> get props => [];
}

class OnGetAbc extends AbcEvent{}

