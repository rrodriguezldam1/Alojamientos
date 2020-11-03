import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/puntoalojamientos_models.dart';
import '../models/puntos_model.dart';


class PuntosProvider {
 final listaTipos = [
   'Cambiar Nombre',
 ];

 List<PuntoAlojamiento> listaPuntos = [];

 List<String> listaModalidades = [];

 Future<List<PuntoAlojamiento>> cargarPuntos() async{
   final data = await rootBundle.loadString('assets/data/Opendata_Resultados_DD_es.json');
   final decodedData = json.decode(data);
   final openData = decodedData['OpenData'];
   final openDataRow = openData['OpenDataRow'];
   Puntos puntos = Puntos.fromJsonList(openDataRow);
   listaPuntos = puntos.lista;
   return listaPuntos;
  }

  Future<List<String>> cargarModalidades() async{
    if (listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaModalidades = [];
    listaPuntos.forEach((moda) {
      if (listaModalidades.indexOf(moda.modalidad) < 0) {
        listaModalidades.add(moda.modalidad);
      }
    });
    return listaModalidades;
  }
}

final puntosProvider = new PuntosProvider();