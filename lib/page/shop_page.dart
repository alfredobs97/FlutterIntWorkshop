import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/provider/gift_provider.dart';
import 'package:flutter_interact_workshop/widget/mini_gift_card.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  GiftProvider _giftProvider = GiftProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'SANTA´S GIFT BAG',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _giftProvider.getShopGifts(),
        builder: (context, snapshot) {

          final shopGifts = snapshot.data;

          if(snapshot.hasData) {

            return GridView.builder(
              itemCount: shopGifts.length,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              itemBuilder: (BuildContext context, int index) {
                return MiniGiftCard(
                  gift: shopGifts[index],
                  onGiftSelected: (gift) => _giftProvider.addGift(gift),
                  onGiftUnselected: (gift) => _giftProvider.removeGift(gift),
                );
              },
            );

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
