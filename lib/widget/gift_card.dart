import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/model/gift.dart';

class GiftCard extends StatelessWidget {

  final Gift gift;

  GiftCard({this.gift});

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
              image: NetworkImage(gift.image),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1],
              colors: [Colors.blueGrey.withOpacity(0.1), const Color(0xFF64B5F6)]),
          ),
        ),

        Container(
          height: containerHeight,
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              gift.name,
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
