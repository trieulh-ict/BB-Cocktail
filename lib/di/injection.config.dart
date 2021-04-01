// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sembast/sembast.dart' as _i4;

import '../model/response/models/drinks.dart' as _i6;
import '../repository/local/cocktaildb_local_api.dart' as _i3;
import '../repository/remote/cocktaildb_remote_api.dart' as _i11;
import '../routes.dart' as _i12;
import '../ui/detail/detail_cubit.dart' as _i5;
import '../ui/discovery/discovery_cubit.dart' as _i8;
import '../ui/favourite/favourite_cubit.dart' as _i9;
import '../ui/search/search_cubit.dart' as _i10;
import 'module/api_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiMmodule = _$ApiMmodule();
  gh.factory<_i3.CocktailDBLocalApi>(() => _i3.CocktailDBLocalApi());
  await gh.factoryAsync<_i4.Database>(() => apiMmodule.database,
      preResolve: true);
  gh.factoryParam<_i5.DetailCubit, _i6.Drinks, dynamic>(
      (drink, _) => _i5.DetailCubit(drink));
  gh.lazySingleton<_i7.Dio>(() => apiMmodule.dio);
  gh.factory<_i8.DiscoveryCubit>(() => _i8.DiscoveryCubit());
  gh.factory<_i9.FavouriteCubit>(() => _i9.FavouriteCubit());
  gh.factory<_i10.SearchCubit>(() => _i10.SearchCubit());
  gh.factory<_i11.CocktailDBRemoteApi>(
      () => _i11.CocktailDBRemoteApi(get<_i7.Dio>()));
  gh.singleton<_i12.BBCRoute>(_i12.BBCRoute());
  return get;
}

class _$ApiMmodule extends _i13.ApiMmodule {}
