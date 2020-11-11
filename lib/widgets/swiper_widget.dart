import 'package:alojamientos/models/puntoalojamientos_models.dart';
import 'package:alojamientos/screens/mapa_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  final List<String> lista;

  SwiperWidget({
    @required this.lista,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    final List<Widget> lst = [];
    final c = GestureDetector(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MapaScreen(puntoAlojamiento: null))
        );
      },
    );

    final screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemWidth: screenSize.width * 0.7,
      itemHeight: screenSize.height * 0.5,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),

          //         child: Image.network(
          //   "http://via.placeholder.com/350x150",
          //   fit: BoxFit.fill,
          // ),
          child: FadeInImage(
            placeholder: AssetImage('assets/data/images/turismo.jpg'),
            image: AssetImage('assets/data/images/alojamiento.jpg'
                //_getImgUrl()
                ),
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: 1,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }

  //  final url =
  //      'https://www.turismo.navarra.es/imgs/rrtt/01/02/02/00/413FotoTH1.jpg';

  //  String _getImgUrl() {
  //    return url;
  //  }

}
