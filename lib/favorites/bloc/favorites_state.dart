part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
  
  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState{}
class FavoritesSuccessState extends FavoritesState{
  final List<dynamic> userFavorites;

  FavoritesSuccessState({required this.userFavorites});

  @override
  List<Object> get props => [userFavorites];
}
class FavoritesErrorState extends FavoritesState{}

class FavoritesRemoveSuccessState extends FavoritesState{}