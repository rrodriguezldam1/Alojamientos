
import 'package:alojamientos/models/puntoalojamientos_models.dart';
import 'package:alojamientos/providers/puntos_provider.dart';
import 'package:alojamientos/widgets/menu_widget.dart';
import 'package:alojamientos/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Alojamiento"),
        ),
        drawer: MenuWidget(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_slider(),],
          ),
        ));
  }

  Widget _slider() {
    return FutureBuilder(
      future: puntosProvider.getListaAlojamientos(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SliderWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}