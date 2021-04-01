import 'package:bb_cocktail/ui/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'main_page.dart';
import 'model/response/models/drinks.dart';

@singleton
class BBCRoute {
  const BBCRoute() : super();

  static const String routeMain = '/';
  static const String routeDetail = '/detail';

  Route onGerenateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BBCRoute.routeDetail:
        return MaterialPageRoute(
          builder: (context) => DetailPage(
            drink: settings.arguments as Drinks,
          ),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );
    }
  }
}
