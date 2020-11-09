import 'package:alojamientos/screens/listaLocalidades_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: ListaLocalidadesScreen()//ListaModalidadesScreen(),//ListaPuntosScreen(),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
