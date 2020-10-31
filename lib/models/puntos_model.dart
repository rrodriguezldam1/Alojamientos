import 'puntoalojamientos_models.dart';

class Puntos {
List<PuntoAlojamiento> lista = new List();
Puntos.fromJsonList(List<dynamic> jsonList) {
  if (jsonList == null) return;
  jsonList.forEach((json) {
    final al = PuntoAlojamiento.fromJson(json);
    lista.add(al);
  });
 }
}