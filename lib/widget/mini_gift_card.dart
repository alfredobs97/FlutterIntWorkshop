import 'package:flutter/material.dart';
import 'package:flutter_interact_workshop/model/gift.dart';
import 'package:flutter_interact_workshop/provider/gift_provider.dart';

typedef GiftCardAction = void Function(Gift gift);

class MiniGiftCard extends StatefulWidget {

  final Gift gift;

  final GiftCardAction onGiftSelected;
  final GiftCardAction onGiftUnselected;

  MiniGiftCard({this.gift, this.onGiftSelected, this.onGiftUnselected});

  @override
  _MiniGiftCardState createState() => _MiniGiftCardState();
}

class _MiniGiftCardState extends State<MiniGiftCard> {

  bool _isSelected;

  final ImageIcon noSelectedIcon = ImageIcon(AssetImage('assets/gift-transparent.png'));
  final ImageIcon selectedIcon = ImageIcon(AssetImage('assets/gift-fill.png'));

  final double cardBorderRadius = 10;

  @override
  void initState() {
    super.initState();
    _isSelected = GiftProvider().hasGift(widget.gift);
  }

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

            Expanded(child: Image.network(widget.gift.image, fit: BoxFit.cover)),

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
                        widget.gift.name,
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
      _isSelected ? widget.onGiftUnselected(widget.gift) : widget.onGiftSelected(widget.gift);
      _isSelected = !_isSelected;
    });
  }
}