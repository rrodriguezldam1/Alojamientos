import 'package:alojamientos/models/puntoalojamientos_models.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final List<String> lista;

  SliderWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _slider(context),
    );
  }

  Widget _slider(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;
    return Container(
      //height: screenSize.height = 0.2,
      child: PageView( 
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.5),
        children: _elementos(context),
      )
    );
  }

  List<Widget> _elementos(BuildContext context) {
    final List<Widget> lst = [];
    lista.forEach((a) {
      final c = ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage(
          placeholder: AssetImage('assets/data/images/turismo.jpg'),
          image: AssetImage('assets/images/local/CasaRural.jpg'),
          fit: BoxFit.cover,
          height: 120.0,
        ),
      );
      lst.add(c);
    });
    return lst;
  }
}