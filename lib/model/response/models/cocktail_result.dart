import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'drinks.dart';

part 'cocktail_result.g.dart';

@JsonSerializable()
class CocktailResult extends Equatable {
  @JsonKey(name: 'drinks')
  final List<Drinks> drinks;

  const CocktailResult({this.drinks});

  @override
  String toString() => 'CocktailResult(drinks: $drinks)';

  factory CocktailResult.fromJson(Map<String, dynamic> json) =>
      _$CocktailResultFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailResultToJson(this);

  CocktailResult copyWith({
    List<Drinks> drinks,
  }) => CocktailResult(
      drinks: drinks ?? this.drinks,
    );

  @override
  List<Object> get props => [drinks];
}
