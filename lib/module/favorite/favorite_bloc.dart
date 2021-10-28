import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, bool> {
  bool isLike = true;
  FavoriteBloc() : super(true);

  // @override
  // CounterState get initialState => CounterState(1);

  @override
  Stream<bool> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is Favorite) {
      yield !isLike;
    } 
    // else if (event is Disfavorite) {
    //   yield false;
    // } 
  }
}
