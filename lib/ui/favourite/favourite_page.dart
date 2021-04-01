import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/routes.dart';
import 'package:bb_cocktail/ui/common/cocktail_grid_view.dart';
import 'package:bb_cocktail/ui/favourite/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  FavouriteCubit cubit = getIt<FavouriteCubit>();

  @override
  void initState() {
    cubit.getAllFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final containerPadding = 16.0;

    return BlocProvider<FavouriteCubit>(
      create: (context) => cubit,
      child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + containerPadding,
              left: containerPadding,
              right: containerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Favourites',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'DMSerifDisplay',
                      height: 1),
                ),
              ),
              BlocBuilder<FavouriteCubit, FavouriteState>(
                builder: (context, state) => _buildFavouriteBody(state),
              )
            ],
          )),
    );
  }

  Widget _buildFavouriteBody(state) {
    Widget content;

    if (state is FavouriteEmpty) {
      content = Center(
        child: Text(
          'You have no favourite drink.',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 40, color: Color.fromARGB(255, 38, 38, 41)),
        ),
      );
    } else if (state is FavouriteLoading) {
      content = Center(
        child: Text(
          'No Cocktail matched.',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 40, color: Color.fromARGB(255, 38, 38, 41)),
        ),
      );
    } else if (state is FavouriteSuccess) {
      content = CocktailGridView(
        items: state.favourites,
        favourites: state.favourites,
        onTap: (drink) async {
          final isFavouriteUpdated = await Navigator.pushNamed(
              context, BBCRoute.routeDetail,
              arguments: drink);
          if (isFavouriteUpdated) {
            cubit.getAllFavourite();
          }
        },
        onFavouriteTriggered: (drink) {
          cubit.toggleFavourite(drink);
        },
      );
    }

    return Expanded(child: content);
  }
}
