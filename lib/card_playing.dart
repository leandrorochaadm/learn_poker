import 'package:aprenda_poker/card_model.dart';
import 'package:aprenda_poker/suits_enum.dart';
import 'package:flutter/material.dart';

class CardPlaying extends StatefulWidget {
  final CardModel card;
  const CardPlaying(
    this.card,
  ) : super();

  @override
  State<CardPlaying> createState() => _CardPlayingState();
}

class _CardPlayingState extends State<CardPlaying> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Color _color =
        (widget.card.suit == Suits.diamonds || widget.card.suit == Suits.hearts)
            ? Colors.red
            : Colors.black;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.04, right: height * 0.01),
      child: Row(children: [
        Text(
          "${widget.card.label}${widget.card.SuitIcon()}",
          style: TextStyle(color: _color, fontSize: 24),
        )
      ]),
    );
  }
}
