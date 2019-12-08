import 'package:flutter/material.dart';

class MiniGift extends StatefulWidget {
  bool isSelected = false;

  

    /* 
    
    final String img;
  final String nameGift;
  MiniGift({this.img, this.nameGift, this.isSelected});
    
    widget.isSelected
                              ? widget.removeGift(widget.img, widget.nameGift)
                              : widget.addGift(widget.img, widget.nameGift); */

  @override
  _MiniGiftState createState() => _MiniGiftState();
}

class _MiniGiftState extends State<MiniGift> {
  ImageIcon noSelect = ImageIcon(AssetImage('assets/gift-transparent.png'));
  ImageIcon select = ImageIcon(AssetImage('assets/gift-fill.png'));
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network('https://lamanzanamordida.net/app/uploads-lamanzanamordida.net/2019/11/Captura-de-pantalla-2019-11-13-a-las-14.45.05.png', fit: BoxFit.fill),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Macbook Pro',
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    IconButton(
                      icon: widget.isSelected ? select : noSelect,
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          widget.isSelected = widget.isSelected ? false : true;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10,
      margin: EdgeInsets.all(10),
    );
  }
}