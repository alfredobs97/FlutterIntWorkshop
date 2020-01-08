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

  final double cardBorderRadius = 10;

  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardBorderRadius)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(child: Image.network(widget.image, fit: BoxFit.cover)),

            Container(
              height: 56,
              color: const Color(0xFF64B5F6),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Expanded(
                      child: Text(
                        widget.giftName,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
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

          ],
        ),
      ),
    );
  }

  _selectPressed() {
    setState(() {
      _isSelected ? widget.onRemoveGift(widget.image, widget.giftName) : widget.onAddGift(widget.image, widget.giftName);
      _isSelected = !_isSelected;
    });
  }
}