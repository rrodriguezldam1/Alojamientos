import 'dart:convert';

import 'package:alojamientos/models/puntoalojamientos_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';

class MapaScreen extends StatefulWidget {
  final PuntoAlojamiento puntoAlojamiento;

  MapaScreen({@required this.puntoAlojamiento});
  @override
  _MapaScreenState createState() => _MapaScreenState(puntoAlojamiento: puntoAlojamiento);
}

class _MapaScreenState extends State<MapaScreen> {
   final PuntoAlojamiento puntoAlojamiento;
  _MapaScreenState({@required this.puntoAlojamiento}) ;
  @override
  Widget build(BuildContext context) {
    // String str = '{'
    //     '"COD. INSCRIPCIÓN": "UAT00704            ",'
    //     '"NOMBRE": "22 Caldereros",'
    //     '"MODALIDAD": "Apartamento Turístico",'
    //     '"CATEGORIA": "Segunda/2 Llaves",'
    //     '"DIRECCIÓN": "Caldereria 22 2º",'
    //     '"LOCALIDAD": "PAMPLONA",'
    //     '"MUNICIPIO": "PAMPLONA <> IRUÑA,"'
    //     '"ZONA": "Cuenca de Pamplona",'
    //     '"PLAZAS": "3",'
    //     '"FECHA DE INSCRIPCION": "12/12/2017 0:00:00"'
    //     '}';
    // final PuntoAlojamiento pa = PuntoAlojamiento.fromJson(json.decode(str));
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa alojamientos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: _crearFlutterMap(puntoAlojamiento),
      // floatingActionButton: FloatingActionButton(
      //     heroTag: "btn2",
      //     onPressed: () => Get.to(Mapa2Screen()),
      //     child: Icon(Icons.keyboard_arrow_right)),
    );
  }

  _crearFlutterMap(PuntoAlojamiento puntoAlojamiento) {
    return FlutterMap(
      options: MapOptions(
          //center: new LatLng(double.parse(pa.x), double.parse(pa.y)), zoom: 18),
          center: puntoAlojamiento.getLatLon(), zoom: 18),
          
      layers: [
        _crearMapa(),
        _crearMarcadores(puntoAlojamiento),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?acces_token={accessToken}',
        additionalOptions: {
          'accessToken': 'pk.eyJ1IjoiaW9uZWliYW5leiIsImEiOiJja2hjNXBubzYwMXF3MnFudW84NDQ2eWhrIn0.Vgzvc7IxyaBGMVYTNaP7YA',
          'id': 'mapbox.satellite'}          
     );
  }

  _crearMarcadores(PuntoAlojamiento puntoAlojamiento) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
        width: 50.0,
        height: 50.0,
        //point: new LatLng(double.parse(pa.x), double.parse(pr.y)),
        point: puntoAlojamiento.getLatLon(),
        builder: (context) => Container(
          child: Icon(
            Icons.location_on,
            size: 70.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      )
    ]);
  }
}
