import 'package:flutter/material.dart';

import 'screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 stats',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        accentColor: Color.fromRGBO(58, 96, 100, 1.0),
      ),
      home: LoadingScreen(),
    );
  }
}
