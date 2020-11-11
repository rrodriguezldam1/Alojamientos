// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:latlong/latlong.dart';

PuntoAlojamiento welcomeFromJson(String str) => PuntoAlojamiento.fromJson(json.decode(str));

String welcomeToJson(PuntoAlojamiento data) => json.encode(data.toJson());

class PuntoAlojamiento {
  final _dir = 'assets/images/local/';

  getLatLon() {
    return new LatLng(42.82569,-1.63246);
}

  getimgPath() {
    return _dir + 'CasaRural.jpg';
}
    PuntoAlojamiento({
        this.codInscripcion,
        this.nombre,
        this.modalidad,
        this.categoria,
        this.direccion,
        this.localidad,
        this.municipio,
        this.zona,
        this.plazas,
        this.fechaDeInscripcion,
    });

    String codInscripcion;
    String nombre;
    String modalidad;
    String categoria;
    String direccion;
    String localidad;
    String municipio;
    String zona;
    String plazas;
    String fechaDeInscripcion;

    factory PuntoAlojamiento.fromJson(Map<String, dynamic> json) => PuntoAlojamiento(
        codInscripcion: json["COD. INSCRIPCIÓN"],
        nombre: json["NOMBRE"],
        modalidad: json["MODALIDAD"],
        categoria: json["CATEGORIA"],
        direccion: json["DIRECCIÓN"],
        localidad: json["LOCALIDAD"],
        municipio: json["MUNICIPIO"],
        zona: json["ZONA"],
        plazas: json["PLAZAS"],
        fechaDeInscripcion: json["FECHA DE INSCRIPCION"],
    );

    Map<String, dynamic> toJson() => {
        "COD. INSCRIPCIÓN": codInscripcion,
        "NOMBRE": nombre,
        "MODALIDAD": modalidad,
        "CATEGORIA": categoria,
        "DIRECCIÓN": direccion,
        "LOCALIDAD": localidad,
        "MUNICIPIO": municipio,
        "ZONA": zona,
        "PLAZAS": plazas,
        "FECHA DE INSCRIPCION": fechaDeInscripcion,
    };
}
