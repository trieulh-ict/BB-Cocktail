import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:flutter/material.dart';

class CocktailGridItem extends StatelessWidget {
  const CocktailGridItem({
    @required Function(Drinks drink) onTap,
    @required Function(Drinks drink) onFavouriteTriggered,
    @required this.drink,
    @required bool isFavourite,
    Key key,
  })  : _onTap = onTap,
        _onFavouriteTriggered = onFavouriteTriggered,
        _isFavourite = isFavourite ?? false,
        super(key: key);

  final Function(Drinks drink) _onTap;
  final Function(Drinks drink) _onFavouriteTriggered;
  final Drinks drink;
  final bool _isFavourite;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => _onTap(drink),
        child: Column(children: [
          Expanded(
            child: Stack(children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    drink.strDrinkThumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    _isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () => _onFavouriteTriggered(drink),
                ),
              )
            ]),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                drink.strDrink,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'DMSerifDisplay'),
              ))
        ]),
      );
}
