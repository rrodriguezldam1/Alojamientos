import 'package:alojamientos/screens/listpuntos_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ListaPuntosScreen(),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
