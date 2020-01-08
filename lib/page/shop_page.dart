import 'package:flutter/material.dart';
import '../widget/mini_gift.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopPage extends StatefulWidget {

  final Function onAddGift;
  final Function onRemoveGift;

  ShopPage({this.onAddGift, this.onRemoveGift});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  List<MiniGift> _shopGift = List();

  Future<List<MiniGift>> getGifts() async {
    final responseJson = await http.get('http://vps675002.ovh.net:81/getGifts').then((response) => jsonDecode(response.body));
    List<MiniGift> gifts = List();
    responseJson.forEach((gift) {
      gifts.add(MiniGift(
        image: gift['img'],
        giftName: gift['name'],
        onAddGift: widget.onAddGift,
        onRemoveGift: widget.onRemoveGift,
      ));
    });

    return gifts;
  }

  void initState() {
    super.initState();
    getGifts().then((gifts) {
      _shopGift = gifts;
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
        child: _shopGift.length < 1
          ? CircularProgressIndicator()
          : GridView.builder(
          itemCount: _shopGift.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: _shopGift[index],
            );
          },
        )),
    );
  }
}
