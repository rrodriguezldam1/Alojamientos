import 'package:alojamientos/models/puntoalojamientos_models.dart';
import 'package:alojamientos/providers/puntos_provider.dart';
import 'package:alojamientos/screens/listaLocalidades_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaModalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Modalidades"),),
      body: _lista(),
      floatingActionButton: new FloatingActionButton(onPressed: () {
        Get.offAll(ListaLocalidadesScreen(), arguments: args);
      },
      child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.cargarPuntosFiltrados(args['localidad']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  List<Widget> _listaElementos(List<PuntoAlojamiento> data) {
    final List<Widget> lst = [];
    data.forEach((al) {
      final w = ListTile(
        title: Text(al.modalidad),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          // args['modalidad'] = al;
         // Get.offAll(Screen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}