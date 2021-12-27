import 'dart:math';

import 'package:aprenda_poker/card_model.dart';
import 'package:aprenda_poker/card_playing.dart';
import 'package:aprenda_poker/suits_enum.dart';
import 'package:flutter/material.dart';

import 'hand_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> table = [];
  @override
  Widget build(BuildContext context) {
    table = _cheapSort();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: table.map((e) => CardPlaying(e)).toList(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sequência Real Royal')),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sequência de mesmo naipe	')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Quadra')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Full House')),
                      ElevatedButton(
                        onPressed: () {
                          checkHand(context, Hands.flush, table);
                        },
                        child: const Text('Flush'),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Sequência')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Trinca')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Dois Pares')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Pares')),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Carta Alta')),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<CardModel> _cheapComplete() {
    return [
      CardModel(label: "A", suit: Suits.clubs, value: 1),
      CardModel(label: "A", suit: Suits.diamonds, value: 1),
      CardModel(label: "A", suit: Suits.hearts, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.clubs, value: 1),
      CardModel(label: "A", suit: Suits.diamonds, value: 1),
      CardModel(label: "A", suit: Suits.hearts, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.hearts, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
      CardModel(label: "A", suit: Suits.spades, value: 1),
    ];
  }

  List<CardModel> _cheapSort() {
    List<CardModel> cheapUse = _cheapComplete();

    List<CardModel> table = [];

    Random random = Random();
    while (table.length < 5) {
      int randomNumber = random.nextInt(cheapUse.length);
      table.add(cheapUse[randomNumber]);
      cheapUse.removeAt(randomNumber);
    }

    return table;
  }

  checkHand(BuildContext context, Hands hand, List<CardModel> cards) {
    if (Hands.flush == hand) {
      _showDialog(context, isFlush(cards));
    }
  }

  bool isFlush(List<CardModel> hand) {
    Suits firstSuit = hand[0].suit;
    return hand.every((element) => element.suit == firstSuit);
  }

  void _showDialog(BuildContext context, bool correct) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: correct
              ? const Text('Acertou', style: TextStyle(color: Colors.green))
              : const Text('Errou', style: TextStyle(color: Colors.red)),
          actions: <Widget>[
            TextButton(
              child: const Text("Sortiar novas cartas"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  table = _cheapSort();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
