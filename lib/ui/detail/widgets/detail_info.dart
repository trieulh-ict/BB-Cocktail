import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  final Drinks drink;
  const DetailInfo({@required Drinks drink, Key key})
      : this.drink = drink,
        super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 32),
              child: _buildShortInfo(drink),
            ),
            Text(
              'Instructions',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 16),
              child: Text(
                drink.strInstructions,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: Column(
                children: drink
                    .getIngredientMap()
                    .entries
                    .map(_buildIngredientRow)
                    .toList(),
              ),
            )
          ],
        ),
      );

  Widget _buildShortInfo(Drinks drink) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.bookmark_rounded, color: Colors.white),
              SizedBox(
                width: 4,
              ),
              Text(drink.strCategory,
                  style: TextStyle(fontSize: 16, color: Colors.white))
            ],
          ),
          Row(
            children: [
              Icon(Icons.local_drink_rounded, color: Colors.white),
              SizedBox(
                width: 4,
              ),
              Text(drink.strAlcoholic,
                  style: TextStyle(fontSize: 16, color: Colors.white))
            ],
          ),
          Row(
            children: [
              Icon(Icons.wine_bar_rounded, color: Colors.white),
              SizedBox(
                width: 4,
              ),
              Text(drink.strGlass,
                  style: TextStyle(fontSize: 16, color: Colors.white))
            ],
          )
        ],
      );

  Widget _buildIngredientRow(MapEntry<String, String> entry) => Row(
        children: [
          Text(entry.key, style: TextStyle(fontSize: 16, color: Colors.white)),
          Spacer(),
          Text(entry.value,
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      );
}
