// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktaildb_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CocktailDBApi implements CocktailDBApi {
  _CocktailDBApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.thecocktaildb.com/api/json/v1/1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CocktailResult> getRandomCockTail() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('random.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CocktailResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<CocktailResult> getCocktailsByName(name) async {
    ArgumentError.checkNotNull(name, 'name');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': name};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('search.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CocktailResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<CocktailResult> getCocktailsByIngredient(ingredient) async {
    ArgumentError.checkNotNull(ingredient, 'ingredient');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'i': ingredient};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('filter.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CocktailResult.fromJson(_result.data);
    return value;
  }
}
