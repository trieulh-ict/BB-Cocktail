// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailResult _$CocktailResultFromJson(Map<String, dynamic> json) {
  return CocktailResult(
    drinks: (json['drinks'] as List)
        ?.map((e) =>
            e == null ? null : Drinks.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CocktailResultToJson(CocktailResult instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
