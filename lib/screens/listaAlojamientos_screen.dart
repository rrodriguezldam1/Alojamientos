import 'package:alojamientos/providers/puntos_provider.dart';
import 'package:alojamientos/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaAlojamientos extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Alojamientos de Navarra"),
        ),
        body: Container(
          child: Column(
            
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 20.0,
              // ),
              // Center(
              //     child: Text(
              //   "Información web",
              //   style: Theme.of(context).textTheme.headline6,
              // )),
              Padding(padding: EdgeInsets.all(20.0)),
              //  SizedBox(
              //    height: 20.0,
              //  ),
              _swiper(),
              // SizedBox(
              //   height: 20.0,
              // ),
              // Container(
              //     padding: EdgeInsets.only(left: 20.0),
              //     child: Text("Acceso al mapa")),
              // SizedBox(
              //   height: 20.0,
              // ),
            ],
          ),
        ));
  }

  Widget _swiper() {
    return FutureBuilder(
      future: puntosProvider.getListaAlojamientos(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
