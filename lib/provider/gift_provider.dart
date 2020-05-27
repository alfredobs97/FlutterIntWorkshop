

import 'dart:convert';

import 'package:flutter_interact_workshop/model/gift.dart';
import 'package:http/http.dart' as http;

class GiftProvider {

  static final GiftProvider _instance = GiftProvider._internal();

  List<Gift> _myGifts = List();

  List<Gift> get myGifts => _myGifts;

  factory GiftProvider() {
    return _instance;
  }

  GiftProvider._internal();

  void addGift(Gift gift) {
    _myGifts.add(gift);
  }

  void removeGift(Gift gift) {
    _myGifts.remove(gift);
  }

  bool hasGift(Gift gift) {
    return _myGifts.contains(gift);
  }

  Future<List<Gift>> getShopGifts() async {
    final responseJson = await http.get('http://vps675002.ovh.net:81/getGifts')
      .then((response) => jsonDecode(response.body));
    List<Gift> gifts = List();
    responseJson.forEach((gift) => gifts.add(Gift(gift['img'], gift['name'])));
    return gifts;
  }

}