import 'package:aprenda_poker/card_model.dart';
import 'package:aprenda_poker/card_playing.dart';
import 'package:aprenda_poker/suits_enum.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ac = CardModel(label: "A", suit: Suits.clubs, value: 1);
    final ad = CardModel(label: "A", suit: Suits.diamonds, value: 1);
    final ah = CardModel(label: "A", suit: Suits.hearts, value: 1);
    final as = CardModel(label: "A", suit: Suits.spades, value: 1);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              CardPlaying(ac),
              CardPlaying(ad),
              CardPlaying(ah),
              CardPlaying(as),
              CardPlaying(ac),
            ],
          ),
          /*  Column(
            children: [ElevatedButton(onPressed: () {}, child: Text('T'))],
          )*/
        ],
      ),
    );
  }
}
