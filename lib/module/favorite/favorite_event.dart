
part of 'favorite_bloc.dart';

// import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class Favorite  extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

// class Disfavorite  extends FavoriteEvent {
//   @override
//   List<Object> get props => [];
// }

