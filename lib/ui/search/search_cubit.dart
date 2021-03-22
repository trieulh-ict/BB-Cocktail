import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/model/ui_model/search_item.dart';
import 'package:bb_cocktail/repository/remote/cocktaildb_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Drinks> drinks;

  const SearchSuccess(this.drinks) : super();
}

class SearchFailed extends SearchState {}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final CocktailDBApi api = getIt<CocktailDBApi>();

  SearchCubit() : super(SearchInitial());

  void searchByType(String searchStr, SearchType type) {
    switch (type) {
      case SearchType.ingredient:
        _searchByIngredient(searchStr);
        break;
      default:
        _searchByName(searchStr);
    }
  }

  void _searchByName(String searchStr) {
    emit(SearchInitial());
    api.getCocktailsByName(searchStr).then((value) {
      emit(SearchSuccess(value.drinks ?? List.empty()));
    }).catchError((e) => emit(SearchFailed()));
  }

  void _searchByIngredient(String searchStr) {
    emit(SearchInitial());
    api.getCocktailsByIngredient(searchStr).then((value) {
      emit(SearchSuccess(value.drinks ?? List.empty()));
    }).catchError((e) => emit(SearchFailed()));
  }

  void reset() {
    emit(SearchInitial());
  }
}
