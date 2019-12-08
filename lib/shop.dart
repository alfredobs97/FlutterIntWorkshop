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

  void initState() {
    super.initState();
    getGifts().then((gifts) {
      widget.myGifts = gifts;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SANTA´S GIFT BAG'),
        centerTitle: true,
      ),
      body: Center(
          child: widget.myGifts.length < 1
              ? CircularProgressIndicator()
              : GridView.builder(
                  itemCount: widget.myGifts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: MiniGift(
                        img: widget.myGifts[index].img,
                        nameGift: widget.myGifts[index].nameGift,
                        addGift: widget.addGift,
                        removeGift: widget.removeGift,
                      ),
                    );
                  },
                )),
    );
  }
}
