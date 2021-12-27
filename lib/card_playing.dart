import 'package:aprenda_poker/card_model.dart';
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
    return Container(
        child: Text(
      widget.card.suit.name,
      style: TextStyle(color: Colors.red),
    ));
  }
}
