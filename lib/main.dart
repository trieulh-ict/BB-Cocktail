import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  runApp(BBCApp());
}

class BBCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
