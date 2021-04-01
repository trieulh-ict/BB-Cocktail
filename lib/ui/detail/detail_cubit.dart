import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/repository/local/cocktaildb_local_api.dart';
import 'package:bb_cocktail/repository/remote/cocktaildb_remote_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class DetailState {
  const DetailState();
}

class DetailLoading extends DetailState {
  const DetailLoading({Drinks drink}) : super();
}

class DetailSuccess extends DetailState {
  final Drinks drink;
  final bool isFavourite;
  const DetailSuccess({@required Drinks drink, bool isFavourite})
      : this.drink = drink,
        this.isFavourite = isFavourite ?? false,
        super();
}

class DetailFailed extends DetailState {
  const DetailFailed({Drinks drink}) : super();
}

@injectable
class DetailCubit extends Cubit<DetailState> {
  final CocktailDBRemoteApi _remoteApi = getIt<CocktailDBRemoteApi>();
  final CocktailDBLocalApi _localApi = getIt<CocktailDBLocalApi>();
  Drinks drink;

  @factoryMethod
  DetailCubit(@factoryParam Drinks drink)
      : this.drink = drink,
        super(DetailLoading(drink: drink));

  void getCocktailDetail(String drinkId) {
    emit(DetailLoading(drink: drink));
    _remoteApi.getCocktailById(drinkId).then((value) {
      _emitSuccess(value.drinks.first);
    }).catchError((e) => emit(DetailFailed(drink: drink)));
  }

  void _emitSuccess(Drinks remoteDrink) {
    if (remoteDrink == null) {
      emit(DetailFailed(drink: remoteDrink));
    } else {
      _localApi.isFavourite(remoteDrink.idDrink).then((value) {
        emit(DetailSuccess(drink: remoteDrink, isFavourite: value));
      });
    }
  }

  void toggleFavourite(Drinks drink) {
    _localApi.toggleFavourite(drink).then((value) {
      if (state is DetailSuccess) {
        emit(DetailSuccess(drink: drink, isFavourite: value));
      }
    });
  }
}
