// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/remote/cocktaildb_api.dart' as _i6;
import '../ui/discovery/discovery_cubit.dart' as _i4;
import '../ui/search/search_cubit.dart' as _i5;
import 'module/api_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiMmodule = _$ApiMmodule();
  gh.lazySingleton<_i3.Dio>(() => apiMmodule.dio);
  gh.factory<_i4.DiscoveryCubit>(() => _i4.DiscoveryCubit());
  gh.factory<_i5.SearchCubit>(() => _i5.SearchCubit());
  gh.factory<_i6.CocktailDBApi>(() => _i6.CocktailDBApi(get<_i3.Dio>()));
  return get;
}

class _$ApiMmodule extends _i7.ApiMmodule {}
