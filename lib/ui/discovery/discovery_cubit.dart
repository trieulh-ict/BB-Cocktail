import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/repository/remote/cocktaildb_remote_api.dart';
import 'package:bb_cocktail/utils/list_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class DiscoveryState {
  const DiscoveryState();
}

class DiscoveryLoading extends DiscoveryState {}

class DiscoverySuccess extends DiscoveryState {
  final Drinks drink;
  const DiscoverySuccess(this.drink) : super();
}

class DiscoveryFailed extends DiscoveryState {}

@injectable
class DiscoveryCubit extends Cubit<DiscoveryState> {
  final CocktailDBRemoteApi api = getIt<CocktailDBRemoteApi>();

  DiscoveryCubit() : super(DiscoveryLoading());

  void getRandomCocktail() {
    emit(DiscoveryLoading());
    api.getRandomCockTail().then((value) {
      final Drinks drink = value.drinks.firstOrNull();
      if (drink != null) {
        emit(DiscoverySuccess(drink));
      } else {
        emit(DiscoveryFailed());
      }
    }).catchError((e) => emit(DiscoveryFailed()));
  }
}
