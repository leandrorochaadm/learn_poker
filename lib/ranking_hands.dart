import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'card_model.dart';
import 'suits_enum.dart';

class RankingHands extends StatelessWidget {
  const RankingHands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking das Mãos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            _hand(
              name: 'Royal Straight Flush',
              description:
                  'É uma sequência de cinco cartas do mesmo naipe, que começa em 10 e termina em Às.',
              cards: [
                CardModel(label: '10', value: 0, suit: Suits.clubs),
                CardModel(label: 'Q', value: 0, suit: Suits.clubs),
                CardModel(label: 'J', value: 0, suit: Suits.clubs),
                CardModel(label: 'K', value: 0, suit: Suits.clubs),
                CardModel(label: 'A', value: 0, suit: Suits.clubs),
              ],
            ),
            _hand(
              name: 'Straight Flush',
              description: 'É uma sequência de cinco cartas do mesmo naipe.',
              cards: [
                CardModel(label: '2', value: 0, suit: Suits.hearts),
                CardModel(label: '3', value: 0, suit: Suits.hearts),
                CardModel(label: '4', value: 0, suit: Suits.hearts),
                CardModel(label: '5', value: 0, suit: Suits.hearts),
                CardModel(label: '6', value: 0, suit: Suits.hearts),
              ],
            ),
            _hand(
              name: 'Quadra',
              description: 'Quatro cartas do mesmo valor.',
              cards: [
                CardModel(label: '2', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.diamonds),
                CardModel(label: 'k', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.clubs),
                CardModel(label: 'k', value: 0, suit: Suits.spades),
              ],
            ),
            _hand(
              name: 'Full-House',
              description: 'Consiste em uma trinca e um par.',
              cards: [
                CardModel(label: '9', value: 0, suit: Suits.hearts),
                CardModel(label: '9', value: 0, suit: Suits.diamonds),
                CardModel(label: 'k', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.clubs),
                CardModel(label: 'k', value: 0, suit: Suits.spades),
              ],
            ),
            _hand(
              name: 'Flush',
              description:
                  'Cinco cartas do mesmo naipe, porém fora de sequência.',
              cards: [
                CardModel(label: '8', value: 0, suit: Suits.hearts),
                CardModel(label: '9', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.hearts),
                CardModel(label: 'Q', value: 0, suit: Suits.hearts),
                CardModel(label: '3', value: 0, suit: Suits.hearts),
              ],
            ),
            _hand(
              name: 'Sequência',
              description:
                  'Cinco cartas em sequência com, ao menos, uma de naipe diferente das outras. O valor da sequência é aquele de sua carta mais alta.',
              cards: [
                CardModel(label: '10', value: 0, suit: Suits.hearts),
                CardModel(label: 'Q', value: 0, suit: Suits.diamonds),
                CardModel(label: 'J', value: 0, suit: Suits.hearts),
                CardModel(label: 'K', value: 0, suit: Suits.clubs),
                CardModel(label: 'A', value: 0, suit: Suits.spades),
              ],
            ),
            _hand(
              name: 'Trinca',
              description: 'Três cartas do mesmo valor.',
              cards: [
                CardModel(label: 'k', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.clubs),
                CardModel(label: 'k', value: 0, suit: Suits.spades),
                CardModel(label: '2', value: 0, suit: Suits.hearts),
                CardModel(label: '3', value: 0, suit: Suits.diamonds),
              ],
            ),
            _hand(
              name: 'Dois Pares',
              description:
                  'Duas cartas de um valor e duas outras de outro valor. O valor da mão é o valor do maior par, seguido do valor do menor par.',
              cards: [
                CardModel(label: '8', value: 0, suit: Suits.hearts),
                CardModel(label: '8', value: 0, suit: Suits.diamonds),
                CardModel(label: 'A', value: 0, suit: Suits.hearts),
                CardModel(label: 'A', value: 0, suit: Suits.clubs),
                CardModel(label: 'k', value: 0, suit: Suits.spades),
              ],
            ),
            _hand(
              name: 'Um Par',
              description: 'Duas cartas do mesmo valor.',
              cards: [
                CardModel(label: '9', value: 0, suit: Suits.hearts),
                CardModel(label: '9', value: 0, suit: Suits.diamonds),
                CardModel(label: 'k', value: 0, suit: Suits.hearts),
                CardModel(label: '3', value: 0, suit: Suits.clubs),
                CardModel(label: '2', value: 0, suit: Suits.spades),
              ],
            ),
            _hand(
              name: 'Carta Altas',
              description:
                  'A mão que tiver a carta de maior valor é a vencedora.',
              cards: [
                CardModel(label: '5', value: 0, suit: Suits.hearts),
                CardModel(label: '8', value: 0, suit: Suits.diamonds),
                CardModel(label: '9', value: 0, suit: Suits.hearts),
                CardModel(label: 'k', value: 0, suit: Suits.clubs),
                CardModel(label: 'A', value: 0, suit: Suits.spades),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _hand extends StatelessWidget {
  final String name;
  final String description;
  final List<CardModel> cards;

  const _hand({
    Key? key,
    required this.name,
    required this.cards,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(width: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards
                .map((CardModel card) => Text(
                      "$card  ",
                      style: const TextStyle(fontSize: 30),
                    ))
                .toList(),
          ),
          Text(description),
        ],
      ),
    );
  }
}
