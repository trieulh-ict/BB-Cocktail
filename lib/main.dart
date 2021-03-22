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

class BBCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: MainPage(),
      );
}
