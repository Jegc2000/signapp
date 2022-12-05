part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class OnGetFavorites extends FavoritesEvent{}

class OnRemove extends FavoritesEvent{
  final Map<String, dynamic> toRemoveInfo;

  OnRemove({required this.toRemoveInfo});

  @override
  List<Object> get props => [toRemoveInfo];
}