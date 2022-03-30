import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({Key key}) : super(key: key);
//no es necesario preservar el estado del scrollbar
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          //este es para mantener el aspecto de la imagen
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              //para ajustar el tamaño de la imagen al dispositivo
              fit: BoxFit.cover,
              imageUrl:
                  "https://images.pexels.com/photos/750073/pexels-photo-750073.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            ),
          ),
        ],
      ),
    );
  }
}
