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
    size: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 16,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/dash.png'),
                      radius: MediaQuery.of(context).size.height / 20,
                    ),
                  ),

                  Text(
                    'MY SANTA´S LIST',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  IconButton(
                    icon: Icon(Icons.share),
                    iconSize: 40,
                    onPressed: _shareGifts,
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: gift,
        elevation: 12.0,
        backgroundColor: Colors.red,
        onPressed: _goToShopPage,
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