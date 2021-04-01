import 'dart:async';

import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/repository/local/cocktaildb_local_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/src/api/record_snapshot.dart';

abstract class FavouriteState {
  const FavouriteState();
}

class FavouriteEmpty extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteSuccess extends FavouriteState {
  final List<Drinks> favourites;

  const FavouriteSuccess(this.favourites) : super();
}

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  final CocktailDBLocalApi _localApi = getIt<CocktailDBLocalApi>();

  StreamSubscription<List<RecordSnapshot>> favouriteSubscription;

  FavouriteCubit() : super(FavouriteEmpty()) {
    _listenToFavouriteUpdate();
  }

  @override
  Future<void> close() {
    _localApi.close(favouriteSubscription);
    return super.close();
  }

  void getAllFavourite() {
    emit(FavouriteLoading());
    _localApi.getAllFavourite().then((value) {
      if (value.isEmpty) {
        emit(FavouriteEmpty());
      } else {
        emit(FavouriteSuccess(value));
      }
    });
  }

  void toggleFavourite(Drinks drink) {
    _localApi.toggleFavourite(drink).then((value) {
      getAllFavourite();
    });
  }

  void _listenToFavouriteUpdate() {
    favouriteSubscription = _localApi.observeFavourite().listen((event) {
      if (event.isEmpty) {
        emit(FavouriteEmpty());
      } else {
        emit(FavouriteSuccess(
            event.map((snapshot) => Drinks.fromJson(snapshot.value)).toList()));
      }
    });
  }
}
