import 'dart:async';

import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/model/ui_model/search_item.dart';
import 'package:bb_cocktail/repository/local/cocktaildb_local_api.dart';
import 'package:bb_cocktail/repository/remote/cocktaildb_remote_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Drinks> drinks;
  final List<Drinks> favourites;

  const SearchSuccess(this.drinks, this.favourites) : super();
}

class SearchSuccessEmpty extends SearchState {}

class SearchFailed extends SearchState {}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final CocktailDBRemoteApi _remoteApi = getIt<CocktailDBRemoteApi>();
  final CocktailDBLocalApi _localApi = getIt<CocktailDBLocalApi>();

  StreamSubscription<List<RecordSnapshot>> favouriteSubscription;

  SearchCubit() : super(SearchInitial()) {
    _listenToFavouriteUpdate();
  }

  @override
  Future<void> close() {
    _localApi.close(favouriteSubscription);
    return super.close();
  }

  void searchByType(String searchStr, SearchType type) {
    emit(SearchLoading());
    switch (type) {
      case SearchType.ingredient:
        _searchByIngredient(searchStr);
        break;
      default:
        _searchByName(searchStr);
    }
  }

  void _searchByName(String searchStr) {
    _remoteApi.getCocktailsByName(searchStr).then((value) async {
      _emitSuccess(value.drinks ?? List.empty());
    }).catchError((e) => emit(SearchFailed()));
  }

  void _searchByIngredient(String searchStr) {
    _remoteApi.getCocktailsByIngredient(searchStr).then((value) {
      _emitSuccess(value.drinks ?? List.empty());
    }).catchError((e) => emit(SearchFailed()));
  }

  void _emitSuccess(List<Drinks> drinks) {
    if (drinks.isEmpty) {
      emit(SearchSuccessEmpty());
    } else {
      _localApi
          .getAllFavourite()
          .then((favourites) => emit(SearchSuccess(drinks, favourites)));
    }
  }

  void reset() {
    emit(SearchInitial());
  }

  void refreshFavourite() {
    if (state is SearchSuccess) {
      _emitSuccess((state as SearchSuccess).drinks);
    }
  }

  void toggleFavourite(Drinks drink) {
    _localApi.toggleFavourite(drink);
  }

  void _listenToFavouriteUpdate() {
    favouriteSubscription = _localApi.observeFavourite().listen((event) {
      refreshFavourite();
    });
  }
}
