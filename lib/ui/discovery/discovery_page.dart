import 'package:bb_cocktail/di/injection.dart';
import 'package:bb_cocktail/model/response/models/drinks.dart';
import 'package:bb_cocktail/routes.dart';
import 'package:bb_cocktail/utils/animation_slide_fade_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'discovery_cubit.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  DiscoveryCubit cubit = getIt<DiscoveryCubit>();

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
    cubit.getRandomCocktail();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<DiscoveryCubit>(
        create: (BuildContext context) => cubit,
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 14, 14, 14)),
          child: BlocBuilder<DiscoveryCubit, DiscoveryState>(
            builder: (context, state) {
              if (state is DiscoverySuccess) {
                return Stack(
                  children: [
                    _buildBackgroundImage(state.drink),
                    _buildInfo(context, state.drink)
                  ],
                );
              } else {
                return _buildBackgroundLoading();
              }
            },
          ),
        ),
      );

  Widget _buildBackgroundLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Positioned _buildInfo(BuildContext context, Drinks drink) => Positioned.fill(
          child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 64,
            left: 32,
            right: 32,
            bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _animateDisplay(
                child: Text(
                  'Discover Recipes',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                direction: SlideFadeInDirection.fromRight),
            _animateDisplay(
                child: Text(
                  drink.strDrink,
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontFamily: 'DMSerifDisplay',
                      height: 1),
                ),
                direction: SlideFadeInDirection.fromRight),
            _animateDisplay(
                child: Text(
                  drink.strCategory,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                direction: SlideFadeInDirection.fromRight),
            Spacer(),
            _buildDiscoverButton(drink),
          ],
        ),
      ));

  Widget _buildDiscoverButton(Drinks drink) => _animateDisplay(
        child: Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, BBCRoute.routeDetail,
                  arguments: drink);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('Discover'), Icon(Icons.keyboard_arrow_right)],
            ),
          ),
        ),
      );

  Widget _animateDisplay({Widget child, SlideFadeInDirection direction}) =>
      SlideFadeInTransition(
        controller: _controller,
        direction: direction,
        child: child,
      );

  Widget _buildBackgroundImage(Drinks drink) => Positioned.fill(
          child: Image.network(
        drink.strDrinkThumb,
        fit: BoxFit.cover,
      ));
}
