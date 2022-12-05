part of 'abc_bloc.dart';

abstract class AbcEvent extends Equatable {
  const AbcEvent();

  @override
  List<Object> get props => [];
}

class OnGetAbc extends AbcEvent{}

class OnAddToFavorites extends AbcEvent{
  final Map<String, dynamic> infoAboutItem;

  OnAddToFavorites({required this.infoAboutItem});

  @override
  List<Object> get props => [infoAboutItem];
}

