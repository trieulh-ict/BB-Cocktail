import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final Drinks drink;
  final bool isFavourite;
  final Function(Drinks) _onFavouriteTriggered;
  final Function() _onNavigationPressed;

  const DetailHeader(
      {@required Drinks drink,
      @required Function(Drinks drink) onFavouriteTriggered,
      @required Function() onNavigationPressed,
      Widget headerNavigation,
      bool isFavourite,
      Key key})
      : this.drink = drink,
        this._onFavouriteTriggered = onFavouriteTriggered,
        this._onNavigationPressed = onNavigationPressed,
        this.isFavourite = isFavourite ?? false,
        assert(drink != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Stack(children: [
        Positioned.fill(
          child: Image.network(
            drink.strDrinkThumb,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            left: 16,
            bottom: 16,
            right: 80,
            child: Text(
              drink.strDrink,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
            )),
        Positioned(
            right: 16,
            bottom: 8,
            child: IconButton(
              icon: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_outline,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () => _onFavouriteTriggered(drink),
            )),
        _buildHeaderNavigation(context)
      ]);

  Widget _buildHeaderNavigation(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: MaterialButton(
          onPressed: _onNavigationPressed,
          elevation: 0,
          highlightElevation: 0,
          minWidth: 0,
          padding: EdgeInsets.all(16),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          color: Colors.transparent,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
      );
}
