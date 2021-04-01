import 'package:bb_cocktail/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'di/injection.dart';
import 'main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(BBCApp());
}

class BBCApp extends StatefulWidget {
  @override
  _BBCAppState createState() => _BBCAppState();
}

class _BBCAppState extends State<BBCApp> {
  BBCRoute route = getIt<BBCRoute>();

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MainPage(),
        initialRoute: BBCRoute.routeMain,
        onGenerateRoute: route.onGerenateRoute,
      );
}
