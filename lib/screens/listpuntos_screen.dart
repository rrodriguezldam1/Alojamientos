import 'package:flutter/material.dart';

import '../models/puntoalojamientos_models.dart';
import '../providers/puntos_provider.dart';

class ListaPuntosScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListaPuntos Screen'),),
      body: _lista(),
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
      },
    );
  }

  List<Widget> _listaElementos(List<PuntoAlojamiento> data) {
    final List<Widget> lst = [];
    data.forEach((al) {
      final w = ListTile(
        title: Text(al.localidad),
        subtitle: Text(al.direccion),
      );
      lst.add(w);
      lst.add(Divider());
     });
     return lst;
  }
}