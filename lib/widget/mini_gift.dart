import 'package:flutter/material.dart';

class MiniGift extends StatefulWidget {

  final String image;
  final String giftName;

  final Function onAddGift;
  final Function onRemoveGift;

  MiniGift({this.image, this.giftName, this.onAddGift, this.onRemoveGift});

  @override
  _MiniGiftState createState() => _MiniGiftState();
}

class _MiniGiftState extends State<MiniGift> {

  bool _isSelected = false;

  final ImageIcon noSelectedIcon = ImageIcon(AssetImage('assets/gift-transparent.png'));
  final ImageIcon selectedIcon = ImageIcon(AssetImage('assets/gift-fill.png'));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(widget.image, fit: BoxFit.fill),
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
                        widget.giftName,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),

                    IconButton(
                      icon: _isSelected ? selectedIcon : noSelectedIcon,
                      color: Colors.white,
                      onPressed: _selectPressed,
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

  _selectPressed() {
    setState(() {
      _isSelected ? widget.onRemoveGift(widget.image, widget.giftName) : widget.onAddGift(widget.image, widget.giftName);
      _isSelected = !_isSelected;
    });
  }
}