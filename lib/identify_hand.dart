import 'package:flutter/material.dart';

import 'card_model.dart';

class IdentifyHand extends StatefulWidget {
  IdentifyHand({Key? key}) : super(key: key);

  List<CardModel> cardInTable = [];

  @override
  State<IdentifyHand> createState() => _IdentifyHandState();
}

class _IdentifyHandState extends State<IdentifyHand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubra qual é a mão'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              final List<CardModel> hand =
                  await Navigator.pushNamed(context, 'keyboardHand')
                      as List<CardModel>;
              print(hand);
              setState(() {
                widget.cardInTable = hand;
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Carta na mesa',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Row(
              children: widget.cardInTable
                  .map((card) => Text(
                        card.toString(),
                        style: const TextStyle(fontSize: 25),
                      ))
                  .toList()),
          // Text('1♣, 4♥, 9♣, 10♣, J♣, J♠, K♠'),
          // Text('1♣, 4♥, 9♣, 10♣, J♣, J♠, K♠'),
          // Text('1♣, 4♥, 9♣, 10♣, J♣, J♠, K♠'),
        ],
      ),
    );
  }
}
