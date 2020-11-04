import 'package:alojamientos/providers/puntos_provider.dart';
import 'package:flutter/material.dart';

class ListaLocalidadesScreen extends StatelessWidget {
  Map<String,Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localidades"),
      ),
      body: _lista(),
      
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: puntosProvider.cargarLocalidades(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          args['localidad'] = element;
          Navigator.pushNamed(context, 'modalidades', arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
