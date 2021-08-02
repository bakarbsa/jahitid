import 'package:flutter/material.dart';
import 'package:jahitid/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jahit.id',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black, size: 35),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          fontFamily: 'Oxygen'),
      home: SplashScreen(),
    );
  }
}
