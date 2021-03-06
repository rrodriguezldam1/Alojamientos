//import 'package:alojamientos/screens/list_modalidades_screen.dart';
//import 'package:alojamientos/screens/listaLocalidades_screen.dart';
import 'package:alojamientos/screens/listaLocalidades_screen.dart';
import 'package:alojamientos/screens/listaModalidades_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:get_storage/get_storage.dart';

/*void main() {
  runApp(MyApp());
}*/

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String localidad = box.read('localidad');
    String modalidad = box.read('modalidad');

    return GetMaterialApp(
      title: 'Material App',
      home: (localidad!=null)
        ? ListaModalidadesScreen()
          : ListaLocalidadesScreen(),
      //home: ListaLocalidadesScreen(),
      /*initialRoute: 'localidades',
      routes: <String, WidgetBuilder>{
        'localidades': (context) => ListaLocalidadesScreen(),
        'modalidades': (context) => ListaModalidadesScreen(),
      }, */
    );
  }
}
