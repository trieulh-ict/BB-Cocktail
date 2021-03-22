import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drinks.g.dart';

@JsonSerializable()
class Drinks extends Equatable {
  @JsonKey(name: 'idDrink')
  final String idDrink;
  @JsonKey(name: 'strDrink')
  final String strDrink;
  @JsonKey(name: 'strDrinkAlternate')
  final dynamic strDrinkAlternate;
  @JsonKey(name: 'strTags')
  final dynamic strTags;
  @JsonKey(name: 'strVideo')
  final dynamic strVideo;
  @JsonKey(name: 'strCategory')
  final String strCategory;
  @JsonKey(name: 'strIBA')
  final dynamic strIba;
  @JsonKey(name: 'strAlcoholic')
  final String strAlcoholic;
  @JsonKey(name: 'strGlass')
  final String strGlass;
  @JsonKey(name: 'strInstructions')
  final String strInstructions;
  @JsonKey(name: 'strInstructionsES')
  final dynamic strInstructionsEs;
  @JsonKey(name: 'strInstructionsDE')
  final String strInstructionsDe;
  @JsonKey(name: 'strInstructionsFR')
  final dynamic strInstructionsFr;
  @JsonKey(name: 'strInstructionsIT')
  final String strInstructionsIt;
  @JsonKey(name: 'strInstructionsZH-HANS')
  final dynamic strInstructionsZhHans;
  @JsonKey(name: 'strInstructionsZH-HANT')
  final dynamic strInstructionsZhHant;
  @JsonKey(name: 'strDrinkThumb')
  final String strDrinkThumb;
  @JsonKey(name: 'strIngredient1')
  final String strIngredient1;
  @JsonKey(name: 'strIngredient2')
  final String strIngredient2;
  @JsonKey(name: 'strIngredient3')
  final String strIngredient3;
  @JsonKey(name: 'strIngredient4')
  final dynamic strIngredient4;
  @JsonKey(name: 'strIngredient5')
  final dynamic strIngredient5;
  @JsonKey(name: 'strIngredient6')
  final dynamic strIngredient6;
  @JsonKey(name: 'strIngredient7')
  final dynamic strIngredient7;
  @JsonKey(name: 'strIngredient8')
  final dynamic strIngredient8;
  @JsonKey(name: 'strIngredient9')
  final dynamic strIngredient9;
  @JsonKey(name: 'strIngredient10')
  final dynamic strIngredient10;
  @JsonKey(name: 'strIngredient11')
  final dynamic strIngredient11;
  @JsonKey(name: 'strIngredient12')
  final dynamic strIngredient12;
  @JsonKey(name: 'strIngredient13')
  final dynamic strIngredient13;
  @JsonKey(name: 'strIngredient14')
  final dynamic strIngredient14;
  @JsonKey(name: 'strIngredient15')
  final dynamic strIngredient15;
  @JsonKey(name: 'strMeasure1')
  final String strMeasure1;
  @JsonKey(name: 'strMeasure2')
  final String strMeasure2;
  @JsonKey(name: 'strMeasure3')
  final String strMeasure3;
  @JsonKey(name: 'strMeasure4')
  final dynamic strMeasure4;
  @JsonKey(name: 'strMeasure5')
  final dynamic strMeasure5;
  @JsonKey(name: 'strMeasure6')
  final dynamic strMeasure6;
  @JsonKey(name: 'strMeasure7')
  final dynamic strMeasure7;
  @JsonKey(name: 'strMeasure8')
  final dynamic strMeasure8;
  @JsonKey(name: 'strMeasure9')
  final dynamic strMeasure9;
  @JsonKey(name: 'strMeasure10')
  final dynamic strMeasure10;
  @JsonKey(name: 'strMeasure11')
  final dynamic strMeasure11;
  @JsonKey(name: 'strMeasure12')
  final dynamic strMeasure12;
  @JsonKey(name: 'strMeasure13')
  final dynamic strMeasure13;
  @JsonKey(name: 'strMeasure14')
  final dynamic strMeasure14;
  @JsonKey(name: 'strMeasure15')
  final dynamic strMeasure15;
  @JsonKey(name: 'strImageSource')
  final dynamic strImageSource;
  @JsonKey(name: 'strImageAttribution')
  final dynamic strImageAttribution;
  @JsonKey(name: 'strCreativeCommonsConfirmed')
  final String strCreativeCommonsConfirmed;
  @JsonKey(name: 'dateModified')
  final String dateModified;

  const Drinks({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIba,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsEs,
    this.strInstructionsDe,
    this.strInstructionsFr,
    this.strInstructionsIt,
    this.strInstructionsZhHans,
    this.strInstructionsZhHant,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      'Drinks(idDrink: $idDrink, strDrink: $strDrink, strDrinkAlternate: $strDrinkAlternate, strTags: $strTags, strVideo: $strVideo, strCategory: $strCategory, strIba: $strIba, strAlcoholic: $strAlcoholic, strGlass: $strGlass, strInstructions: $strInstructions, strInstructionsEs: $strInstructionsEs, strInstructionsDe: $strInstructionsDe, strInstructionsFr: $strInstructionsFr, strInstructionsIt: $strInstructionsIt, strInstructionsZhHans: $strInstructionsZhHans, strInstructionsZhHant: $strInstructionsZhHant, strDrinkThumb: $strDrinkThumb, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, strIngredient6: $strIngredient6, strIngredient7: $strIngredient7, strIngredient8: $strIngredient8, strIngredient9: $strIngredient9, strIngredient10: $strIngredient10, strIngredient11: $strIngredient11, strIngredient12: $strIngredient12, strIngredient13: $strIngredient13, strIngredient14: $strIngredient14, strIngredient15: $strIngredient15, strMeasure1: $strMeasure1, strMeasure2: $strMeasure2, strMeasure3: $strMeasure3, strMeasure4: $strMeasure4, strMeasure5: $strMeasure5, strMeasure6: $strMeasure6, strMeasure7: $strMeasure7, strMeasure8: $strMeasure8, strMeasure9: $strMeasure9, strMeasure10: $strMeasure10, strMeasure11: $strMeasure11, strMeasure12: $strMeasure12, strMeasure13: $strMeasure13, strMeasure14: $strMeasure14, strMeasure15: $strMeasure15, strImageSource: $strImageSource, strImageAttribution: $strImageAttribution, strCreativeCommonsConfirmed: $strCreativeCommonsConfirmed, dateModified: $dateModified)';

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);

  Map<String, dynamic> toJson() => _$DrinksToJson(this);

  Drinks copyWith({
    String idDrink,
    String strDrink,
    String strDrinkAlternate,
    String strTags,
    String strVideo,
    String strCategory,
    String strIba,
    String strAlcoholic,
    String strGlass,
    String strInstructions,
    String strInstructionsEs,
    String strInstructionsDe,
    String strInstructionsFr,
    String strInstructionsIt,
    String strInstructionsZhHans,
    String strInstructionsZhHant,
    String strDrinkThumb,
    String strIngredient1,
    String strIngredient2,
    String strIngredient3,
    String strIngredient4,
    String strIngredient5,
    String strIngredient6,
    String strIngredient7,
    String strIngredient8,
    String strIngredient9,
    String strIngredient10,
    String strIngredient11,
    String strIngredient12,
    String strIngredient13,
    String strIngredient14,
    String strIngredient15,
    String strMeasure1,
    String strMeasure2,
    String strMeasure3,
    String strMeasure4,
    String strMeasure5,
    String strMeasure6,
    String strMeasure7,
    String strMeasure8,
    String strMeasure9,
    String strMeasure10,
    String strMeasure11,
    String strMeasure12,
    String strMeasure13,
    String strMeasure14,
    String strMeasure15,
    String strImageSource,
    String strImageAttribution,
    String strCreativeCommonsConfirmed,
    String dateModified,
  }) =>
      Drinks(
        idDrink: idDrink ?? this.idDrink,
        strDrink: strDrink ?? this.strDrink,
        strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
        strTags: strTags ?? this.strTags,
        strVideo: strVideo ?? this.strVideo,
        strCategory: strCategory ?? this.strCategory,
        strIba: strIba ?? this.strIba,
        strAlcoholic: strAlcoholic ?? this.strAlcoholic,
        strGlass: strGlass ?? this.strGlass,
        strInstructions: strInstructions ?? this.strInstructions,
        strInstructionsEs: strInstructionsEs ?? this.strInstructionsEs,
        strInstructionsDe: strInstructionsDe ?? this.strInstructionsDe,
        strInstructionsFr: strInstructionsFr ?? this.strInstructionsFr,
        strInstructionsIt: strInstructionsIt ?? this.strInstructionsIt,
        strInstructionsZhHans:
            strInstructionsZhHans ?? this.strInstructionsZhHans,
        strInstructionsZhHant:
            strInstructionsZhHant ?? this.strInstructionsZhHant,
        strDrinkThumb: strDrinkThumb ?? this.strDrinkThumb,
        strIngredient1: strIngredient1 ?? this.strIngredient1,
        strIngredient2: strIngredient2 ?? this.strIngredient2,
        strIngredient3: strIngredient3 ?? this.strIngredient3,
        strIngredient4: strIngredient4 ?? this.strIngredient4,
        strIngredient5: strIngredient5 ?? this.strIngredient5,
        strIngredient6: strIngredient6 ?? this.strIngredient6,
        strIngredient7: strIngredient7 ?? this.strIngredient7,
        strIngredient8: strIngredient8 ?? this.strIngredient8,
        strIngredient9: strIngredient9 ?? this.strIngredient9,
        strIngredient10: strIngredient10 ?? this.strIngredient10,
        strIngredient11: strIngredient11 ?? this.strIngredient11,
        strIngredient12: strIngredient12 ?? this.strIngredient12,
        strIngredient13: strIngredient13 ?? this.strIngredient13,
        strIngredient14: strIngredient14 ?? this.strIngredient14,
        strIngredient15: strIngredient15 ?? this.strIngredient15,
        strMeasure1: strMeasure1 ?? this.strMeasure1,
        strMeasure2: strMeasure2 ?? this.strMeasure2,
        strMeasure3: strMeasure3 ?? this.strMeasure3,
        strMeasure4: strMeasure4 ?? this.strMeasure4,
        strMeasure5: strMeasure5 ?? this.strMeasure5,
        strMeasure6: strMeasure6 ?? this.strMeasure6,
        strMeasure7: strMeasure7 ?? this.strMeasure7,
        strMeasure8: strMeasure8 ?? this.strMeasure8,
        strMeasure9: strMeasure9 ?? this.strMeasure9,
        strMeasure10: strMeasure10 ?? this.strMeasure10,
        strMeasure11: strMeasure11 ?? this.strMeasure11,
        strMeasure12: strMeasure12 ?? this.strMeasure12,
        strMeasure13: strMeasure13 ?? this.strMeasure13,
        strMeasure14: strMeasure14 ?? this.strMeasure14,
        strMeasure15: strMeasure15 ?? this.strMeasure15,
        strImageSource: strImageSource ?? this.strImageSource,
        strImageAttribution: strImageAttribution ?? this.strImageAttribution,
        strCreativeCommonsConfirmed:
            strCreativeCommonsConfirmed ?? this.strCreativeCommonsConfirmed,
        dateModified: dateModified ?? this.dateModified,
      );

  @override
  List<Object> get props => [
        idDrink,
        strDrink,
        strDrinkAlternate,
        strTags,
        strVideo,
        strCategory,
        strIba,
        strAlcoholic,
        strGlass,
        strInstructions,
        strInstructionsEs,
        strInstructionsDe,
        strInstructionsFr,
        strInstructionsIt,
        strInstructionsZhHans,
        strInstructionsZhHant,
        strDrinkThumb,
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strImageSource,
        strImageAttribution,
        strCreativeCommonsConfirmed,
        dateModified,
      ];
}
