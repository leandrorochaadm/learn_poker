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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardPlaying(ac),
                CardPlaying(ad),
                CardPlaying(ah),
                CardPlaying(as),
                CardPlaying(ac),
              ],
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
                          onPressed: () {}, child: const Text('Flush')),
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
}
