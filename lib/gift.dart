import 'package:flutter/material.dart';
// final String img;
// final String nameGift;

// Gift({this.img, this.nameGift});

/*  
 */

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
            image: DecorationImage(
                image: NetworkImage(
                    'https://elpais.com/tecnologia/imagenes/2017/09/19/actualidad/1505815835_481570_1505909612_noticia_fotograma.jpg'),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 1],
                colors: [Theme.of(context).backgroundColor.withOpacity(0.0), Theme.of(context).primaryColor]),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Apple watch',
                  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
