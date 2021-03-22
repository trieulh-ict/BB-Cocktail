import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:flutter/material.dart';

class CocktailGridView extends StatelessWidget {
  final List<Drinks> drinks;

  const CocktailGridView({@required List<Drinks> items, Key key})
      : drinks = items,
        super(key: key);

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: drinks.length,
        itemBuilder: (context, index) => _buildCotailGridItem(drinks[index]),
      );

  Widget _buildCotailGridItem(Drinks drink) => Column(children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              drink.strDrinkThumb,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(drink.strDrink,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'DMSerifDisplay')),
        )
      ]);
}
