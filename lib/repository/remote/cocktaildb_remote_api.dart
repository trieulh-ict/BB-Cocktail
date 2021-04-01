import 'package:bb_cocktail/model/response/models/cocktail_result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'cocktaildb_remote_api.g.dart';

@RestApi(baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/')
@injectable
abstract class CocktailDBRemoteApi {
  @factoryMethod
  factory CocktailDBRemoteApi(Dio dio) = _CocktailDBRemoteApi;

  @GET('random.php')
  Future<CocktailResult> getRandomCockTail();

  @GET('search.php')
  Future<CocktailResult> getCocktailsByName(@Query('s') String name);

  @GET('filter.php')
  Future<CocktailResult> getCocktailsByIngredient(
      @Query('i') String ingredient);

  @GET('lookup.php')
  Future<CocktailResult> getCocktailById(@Query('i') String drinkId);
}
