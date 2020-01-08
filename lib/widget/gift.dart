import 'package:flutter/material.dart';

class Gift extends StatelessWidget {

  final String image;
  final String giftName;

  Gift({this.image, this.giftName});

  @override
  Widget build(BuildContext context) {

    final double containerHeight = 170;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Stack(children: [

        Container(
          height: containerHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fill,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1],
              colors: [Colors.blueGrey.withOpacity(0.1), Theme.of(context).primaryColor]),
          ),
        ),

        Container(
          height: containerHeight,
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              giftName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
