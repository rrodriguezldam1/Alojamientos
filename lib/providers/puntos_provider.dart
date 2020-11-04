import 'dart:convert';
import 'dart:core';


import 'package:flutter/services.dart';

import '../models/puntoalojamientos_models.dart';
import '../models/puntos_model.dart';

class PuntosProvider {

  final listaTipos = [
    'Cambiar Nombre',
  ];

  List<PuntoAlojamiento> listaPuntos = [];
  List<String> listaModalidades = [];
  List<String> listaLocalidades = []; 

  Future<List<PuntoAlojamiento>> cargarPuntos() async {
    final data = await rootBundle
        .loadString('assets/data/Opendata_Resultados_DD_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Puntos puntos = Puntos.fromJsonList(openDataRow);
    listaPuntos = puntos.lista;
    return listaPuntos;
  }

  Future<List<String>> cargarLocalidades() async{
    if(listaPuntos.length == 0) {
      await cargarPuntos();
    }
    listaLocalidades = [];
    listaPuntos.forEach((pa){
      if(listaLocalidades.indexOf(pa.localidad) <0){
        listaLocalidades.add(pa.localidad);
      }
    });
    
      listaLocalidades.sort( (String a, String b) => a.compareTo(b));
      return listaLocalidades;
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
