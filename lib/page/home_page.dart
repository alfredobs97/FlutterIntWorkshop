import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/page/shop_page.dart';
import 'package:flutter_interact_workshop/widget/gift.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Gift> _gifts = new List();

  void addGift(String image, String giftName) {
    print('Gift $giftName added');
    _gifts.add(Gift(
      image: image,
      giftName: giftName,
    ));
    print(_gifts.length);
  }

  void removeGift(String image, String giftName) {
    print('Gift $giftName removed');
    _gifts.removeWhere(
        (gift) => gift.image == image && gift.giftName == giftName);
    print(_gifts.length);
  }

  ImageIcon gift = ImageIcon(
    AssetImage('assets/gift-transparent.png'),
    size: 30.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  CircleAvatar(
                    radius: 38,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dash.png'),
                      radius: 29,
                    ),
                  ),

                  Text(
                    'MY SANTA´S LIST',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),

                  IconButton(
                    icon: Icon(Icons.share),
                    iconSize: 30,
                    onPressed: _shareGifts,
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: _gifts.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Dismissible(
                    key: ValueKey(_gifts[index]),
                    child: _gifts[index],
                    background: Container(
                      padding: EdgeInsets.only(right: 20),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Text('Eliminar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onDismissed: (direction) => setState(() => _gifts.removeAt(index)),
                  ),
                );
              },
            ),
          ),

        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: gift,
          elevation: 12.0,
          onPressed: _goToShopPage,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _goToShopPage() {
    Navigator.push(context,
      MaterialPageRoute( builder: (context) =>
                ShopPage(onAddGift: addGift, onRemoveGift: removeGift)));
  }

  _shareGifts() {
    String myCard =
        'Hola Santa Dash, quiero estos regalos porque he programado muy bien: \n';

    _gifts.forEach((gift) {
      myCard += '- ' + gift.giftName + '\n';
    });

    myCard += '¡Muchas gracias Santa Dash!';

    Share.share(myCard, subject: 'Correo para Santa Dash');
  }
}