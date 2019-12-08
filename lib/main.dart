import 'package:flutter/material.dart';
import 'gift.dart';
import 'shop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi lista de regalo',
      theme: ThemeData(
        primaryColor: Colors.blue[200],
        accentColor: Colors.red[400],
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            textTheme: TextTheme(title: TextStyle(color: Colors.indigo[200], fontSize: 25)),
            iconTheme: IconThemeData(color: Colors.indigo[200])),
        iconTheme: IconThemeData(color: Colors.indigo[200], size: 40),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red[400],
        ),
        textTheme: TextTheme(body1: TextStyle(color: Colors.blueGrey)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List<Gift> gifts = new List();

  void addGift(String img, String nameGift) {
    print('add');
    gifts.add(Gift(
      img: img,
      nameGift: nameGift,
    ));
    print(gifts.length);
  }

  void removeGift(String img, String nameGift) {
    print('remove');
    gifts.removeWhere((gift) => gift.img == img && gift.nameGift == nameGift);
    print(gifts.length);
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Gift(
                        img:
                            'https://elpais.com/tecnologia/imagenes/2017/09/19/actualidad/1505815835_481570_1505909612_noticia_fotograma.jpg',
                        nameGift: 'Apple Watch',
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        color: Colors.limeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: gift,
        elevation: 12.0,
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
