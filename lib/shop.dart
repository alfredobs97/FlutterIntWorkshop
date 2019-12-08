import 'package:flutter/material.dart';
import 'mini-gift.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SANTA´S GIFT BAG'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
 MiniGift(img: "https://lamanzanamordida.net/app/uploads-lamanzanamordida.net/2019/11/Captura-de-pantalla-2019-11-13-a-las-14.45.05.png", nameGift: 'Macbook pro', isSelected: false),
  MiniGift(img: "https://lamanzanamordida.net/app/uploads-lamanzanamordida.net/2019/11/Captura-de-pantalla-2019-11-13-a-las-14.45.05.png", nameGift: 'Macbook pro', isSelected: false),
        ],
      ));
  }
}