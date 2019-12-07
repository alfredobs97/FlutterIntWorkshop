import 'package:flutter/material.dart';

class Gift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://elpais.com/tecnologia/imagenes/2017/09/19/actualidad/1505815835_481570_1505909612_noticia_fotograma.jpg'), fit: BoxFit.fill),
          ),
        ),
      ]),
    );
  }
}