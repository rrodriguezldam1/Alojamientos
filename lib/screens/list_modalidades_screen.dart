import 'package:alojamientos/providers/puntos_provider.dart';
import 'package:flutter/material.dart';

class ListaModalidadesScreen extends StatelessWidget {
  Map<String,Object> args = new Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Modalidades"),),
      body: _lista(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: puntosProvider.cargarModalidades(args['localidad']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
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
          Navigator.pushNamed(context, '', arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}