import 'package:alojamientos/screens/fichaTecnica_screen.dart';
import 'package:alojamientos/screens/listaLocalidades_screen.dart';
import 'package:alojamientos/screens/listaModalidades_screen.dart';
import 'package:alojamientos/screens/mapa_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuWidget extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String localidad = box.read('localidad');
    String modalidad = box.read('modalidad');
    String descripcion = box.read('descripcion');
    return Drawer(
      child:  ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Container(decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/local/CasaRural.jpg'),
              fit: BoxFit.cover
              )
          ),),),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_city, color:Colors.green),
            title: Text('Localidad'),
            onTap: () {
            Get.offAll(ListaLocalidadesScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.library_books, color:Colors.green),
            title: Text('Modalidad'),
            onTap: () {
                Get.offAll(ListaModalidadesScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_activity, color:Colors.green),
            title: Text('Descripción'),
            onTap: () {
                Get.offAll(SelectScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.map, color:Colors.green),
            title: Text('Mapa'),
            onTap: () {
                Get.offAll(MapaScreen());
            },
          ),
        ]),
    );
  }
}