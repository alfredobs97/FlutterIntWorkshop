import 'package:flutter/material.dart';

class Gift extends StatelessWidget {

  final String image;
  final String giftName;

  Gift({this.image, this.giftName});

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
                image: NetworkImage(image),
                fit: BoxFit.fill,
            ),
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
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              giftName,
              style: TextStyle(
                fontSize: 30,
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
