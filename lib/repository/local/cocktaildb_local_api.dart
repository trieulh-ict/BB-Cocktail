import 'dart:async';

import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

@injectable
class CocktailDBLocalApi {
  final Database db = getIt<Database>();
  final StoreRef _store = intMapStoreFactory.store('drink_store');

  @factoryMethod
  CocktailDBLocalApi();

  Future<bool> toggleFavourite(Drinks drink) async {
    final finder = Finder(filter: Filter.equals('idDrink', drink.idDrink));
    final storedValue = await _store.findFirst(db, finder: finder);
    if (storedValue == null) {
      await _store.add(db, drink.toJson());
      // ignore: avoid_print
      print('Drinks inserted successfully!');
      return true;
    } else {
      await _store.delete(db, finder: finder);
      // ignore: avoid_print
      print('Drinks deleted successfully!');
      return false;
    }
  }

  Future<List<Drinks>> getAllFavourite() async {
    final snapShot = await _store.find(db);
    final list =
        snapShot.map((snapShot) => Drinks.fromJson(snapShot.value)).toList();
    // ignore: avoid_print
    print('Get all saved Drinks successfully! ${list.length}');
    return list;
  }

  Future<bool> isFavourite(String idDrink) async {
    final finder = Finder(filter: Filter.equals('idDrink', idDrink));
    final favouriteDrink = await _store.findFirst(db, finder: finder);
    return favouriteDrink != null;
  }

  Stream<List<RecordSnapshot>> observeFavourite() {
    final query = _store.query();
    return query.onSnapshots(db);
  }

  void close(StreamSubscription favouriteSubscription) {
    favouriteSubscription.cancel();
  }
}
