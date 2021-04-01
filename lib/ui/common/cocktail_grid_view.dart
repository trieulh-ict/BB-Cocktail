import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/ui/common/cocktail_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CocktailGridView extends StatelessWidget {
  final List<Drinks> _drinks;
  final List<Drinks> _favourites;
  final Function(Drinks) _onTap;
  final Function(Drinks) _onFavouriteTriggered;

  const CocktailGridView(
      {@required List<Drinks> items,
      @required List<Drinks> favourites,
      @required Function(Drinks) onTap,
      @required Function(Drinks drink) onFavouriteTriggered,
      Key key})
      : _drinks = items,
        _favourites = favourites,
        _onTap = onTap,
        _onFavouriteTriggered = onFavouriteTriggered,
        super(key: key);

  @override
  Widget build(BuildContext context) => AnimationLimiter(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: _drinks.length,
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredList(
                  position: index,
                  duration: Duration(milliseconds: 600),
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: CocktailGridItem(
                          onTap: _onTap,
                          onFavouriteTriggered: _onFavouriteTriggered,
                          drink: _drinks[index],
                          isFavourite: _favourites.any((drink) =>
                              drink.strDrink == _drinks[index].strDrink)),
                    ),
                  ),
                )),
      );
}
