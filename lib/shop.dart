import 'package:flutter/material.dart';
import 'mini-gift.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Shop extends StatefulWidget {
  final Function addGift;
  final Function removeGift;
  List<MiniGift> myGifts = List();
  Shop({this.addGift, this.removeGift});
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  Future<List<MiniGift>> getGifts() async {
    final responseJson = await http.get('http://vps675002.ovh.net:81/getGifts').then((response) => jsonDecode(response.body));
    List<MiniGift> gifts = List();
    responseJson.forEach((gift) {
      gifts.add(MiniGift(
        img: gift['img'],
        nameGift: gift['name'],
        addGift: widget.addGift,
        removeGift: widget.removeGift,
      ));
    });

    return gifts;
  }
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
            MiniGift(
              img:
                  "https://lamanzanamordida.net/app/uploads-lamanzanamordida.net/2019/11/Captura-de-pantalla-2019-11-13-a-las-14.45.05.png",
              nameGift: 'Macbook pro',
              addGift: widget.addGift,
              removeGift: widget.removeGift,
            ),
            MiniGift(
              img:
                  "https://lamanzanamordida.net/app/uploads-lamanzanamordida.net/2019/11/Captura-de-pantalla-2019-11-13-a-las-14.45.05.png",
              nameGift: 'Macbook pro',
              addGift: widget.addGift,
              removeGift: widget.removeGift,
            ),
          ],
        ));
  }
}
