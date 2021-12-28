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
                          onPressed: () {
                            checkAnswer(context, Hands.royal_flush, table);
                          },
                          child: const Text('Sequência Real Royal')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.straight_flush, table);
                          },
                          child: const Text('Sequência de mesmo naipe	')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.four_of_a_kind, table);
                          },
                          child: const Text('Quadra')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.full_house, table);
                          },
                          child: const Text('Full House')),
                      ElevatedButton(
                        onPressed: () {
                          checkAnswer(context, Hands.flush, table);
                        },
                        child: const Text('Flush'),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.straight, table);
                          },
                          child: const Text('Sequência')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.three_of_a_kind, table);
                          },
                          child: const Text('Trinca')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.two_pair, table);
                          },
                          child: const Text('Dois Pares')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.one_pair, table);
                          },
                          child: const Text('Um Par')),
                      ElevatedButton(
                          onPressed: () {
                            checkAnswer(context, Hands.high_card, table);
                          },
                          child: const Text('Carta Alta')),
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
      CardModel(label: "A", suit: Suits.clubs, value: 0),
      CardModel(label: "A", suit: Suits.diamonds, value: 0),
      CardModel(label: "A", suit: Suits.hearts, value: 0),
      CardModel(label: "A", suit: Suits.spades, value: 0),
      CardModel(label: "1", suit: Suits.clubs, value: 1),
      CardModel(label: "1", suit: Suits.diamonds, value: 1),
      CardModel(label: "1", suit: Suits.hearts, value: 1),
      CardModel(label: "1", suit: Suits.spades, value: 1),
      CardModel(label: "2", suit: Suits.clubs, value: 2),
      CardModel(label: "2", suit: Suits.diamonds, value: 2),
      CardModel(label: "2", suit: Suits.hearts, value: 2),
      CardModel(label: "2", suit: Suits.spades, value: 2),
      CardModel(label: "3", suit: Suits.clubs, value: 3),
      CardModel(label: "3", suit: Suits.diamonds, value: 3),
      CardModel(label: "3", suit: Suits.hearts, value: 3),
      CardModel(label: "3", suit: Suits.spades, value: 3),
      CardModel(label: "4", suit: Suits.clubs, value: 4),
      CardModel(label: "4", suit: Suits.diamonds, value: 4),
      CardModel(label: "4", suit: Suits.hearts, value: 4),
      CardModel(label: "4", suit: Suits.spades, value: 4),
      CardModel(label: "5", suit: Suits.clubs, value: 5),
      CardModel(label: "5", suit: Suits.diamonds, value: 5),
      CardModel(label: "5", suit: Suits.hearts, value: 5),
      CardModel(label: "5", suit: Suits.spades, value: 5),
      CardModel(label: "6", suit: Suits.clubs, value: 6),
      CardModel(label: "6", suit: Suits.diamonds, value: 6),
      CardModel(label: "6", suit: Suits.hearts, value: 6),
      CardModel(label: "6", suit: Suits.spades, value: 6),
      CardModel(label: "7", suit: Suits.clubs, value: 7),
      CardModel(label: "7", suit: Suits.diamonds, value: 7),
      CardModel(label: "7", suit: Suits.hearts, value: 7),
      CardModel(label: "7", suit: Suits.spades, value: 7),
      CardModel(label: "8", suit: Suits.clubs, value: 8),
      CardModel(label: "8", suit: Suits.diamonds, value: 8),
      CardModel(label: "8", suit: Suits.hearts, value: 8),
      CardModel(label: "8", suit: Suits.spades, value: 8),
      CardModel(label: "9", suit: Suits.clubs, value: 9),
      CardModel(label: "9", suit: Suits.diamonds, value: 9),
      CardModel(label: "9", suit: Suits.hearts, value: 9),
      CardModel(label: "9", suit: Suits.spades, value: 9),
      CardModel(label: "10", suit: Suits.clubs, value: 10),
      CardModel(label: "10", suit: Suits.diamonds, value: 10),
      CardModel(label: "10", suit: Suits.hearts, value: 10),
      CardModel(label: "10", suit: Suits.spades, value: 10),
      CardModel(label: "J", suit: Suits.clubs, value: 11),
      CardModel(label: "J", suit: Suits.diamonds, value: 11),
      CardModel(label: "J", suit: Suits.hearts, value: 11),
      CardModel(label: "J", suit: Suits.spades, value: 11),
      CardModel(label: "Q", suit: Suits.clubs, value: 12),
      CardModel(label: "Q", suit: Suits.diamonds, value: 12),
      CardModel(label: "Q", suit: Suits.hearts, value: 12),
      CardModel(label: "Q", suit: Suits.spades, value: 12),
      CardModel(label: "K", suit: Suits.clubs, value: 13),
      CardModel(label: "K", suit: Suits.diamonds, value: 13),
      CardModel(label: "K", suit: Suits.hearts, value: 13),
      CardModel(label: "K", suit: Suits.spades, value: 13),
    ];
  }

  List<CardModel> _list() {
    return [
      CardModel(label: "A", suit: Suits.hearts, value: 0),
      CardModel(label: "A", suit: Suits.clubs, value: 10),
      CardModel(label: "A", suit: Suits.clubs, value: 10),
      CardModel(label: "A", suit: Suits.clubs, value: 10),
      CardModel(label: "1", suit: Suits.clubs, value: 10),
    ];
  }

  List<CardModel> _cheapSort() {
    List<CardModel> cheapUse = _cheapComplete();

    List<CardModel> table = [];

    Random random = Random();
    do {
      table = [];
      while (table.length < 5) {
        int randomNumber = random.nextInt(cheapUse.length);
        table.add(cheapUse[randomNumber]);
        cheapUse.removeAt(randomNumber);
      }
      // print(table);
    } while (checkHand(table) == Hands.high_card);

    return table;
  }

  void checkAnswer(BuildContext context, Hands hand, List<CardModel> cards) {
    Hands handCorret = checkHand(cards);
    print(handCorret.name + " =" + hand.name);

    _showDialog(context, handCorret == hand, handCorret);
  }

  Hands checkHand(List<CardModel> cards) {
    if (isOnePair(cards)) {
      return Hands.one_pair;
    }
    if (isTwoPair(cards)) {
      return Hands.two_pair;
    }
    if (isThreeOfAKind(cards)) {
      return Hands.three_of_a_kind;
    }
    if (isStraight(cards)) {
      return Hands.straight;
    }
    if (isFlush(cards)) {
      return Hands.flush;
    }
    if (isFullHouse(cards)) {
      return Hands.full_house;
    }
    if (isFourKind(cards)) {
      return Hands.four_of_a_kind;
    }
    if (isStraightFlush(cards)) {
      return Hands.straight_flush;
    }
    if (isRoyalFlush(cards)) {
      return Hands.royal_flush;
    }
    return Hands.high_card;
  }

  bool isRoyalFlush(List<CardModel> cards) {
    Map<int, int> cardGroup = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
      13: 0,
    };

    for (CardModel card in cards) {
      cardGroup[card.value] = cardGroup[card.value]! + 1;
    }

    bool royal = cardGroup[0]! == 1 &&
        cardGroup[10]! == 1 &&
        cardGroup[11]! == 1 &&
        cardGroup[12]! == 1 &&
        cardGroup[13]! == 1;

    return royal && isFlush(cards);
  }

  bool isStraightFlush(List<CardModel> cards) {
    return isFlush(cards) && isStraight(cards);
  }

  bool isFourKind(List<CardModel> cards) {
    Map<int, int> cardGroup = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
      13: 0,
    };

    for (CardModel card in cards) {
      cardGroup[card.value] = cardGroup[card.value]! + 1;
    }
    return cardGroup.values.contains(4);
  }

  bool isFullHouse(List<CardModel> cards) {
    return isTwoPair(cards) && isThreeOfAKind(cards);
  }

  bool isFlush(List<CardModel> cards) {
    Suits firstSuit = cards[0].suit;
    return cards.every((element) => element.suit == firstSuit);
  }

  bool isStraight(List<CardModel> cards) {
    cards.sort((a, b) => a.value.compareTo(b.value));
    List<bool> resul = [];
    for (int i = 0; i < 4; i++) {
      resul.add((cards[i + 1].value - cards[i].value) == 1);
      // print("${cards[i + 1].toString()}${cards[i].toString()}${resul}");
    }

    return resul.every((element) => element == true);
  }

  bool isThreeOfAKind(List<CardModel> cards) {
    Map<int, int> cardGroup = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
      13: 0,
    };

    for (CardModel card in cards) {
      cardGroup[card.value] = cardGroup[card.value]! + 1;
    }
    return cardGroup.values.contains(3);
  }

  bool isTwoPair(List<CardModel> cards) {
    Map<int, int> cardGroup = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
      13: 0,
    };

    for (CardModel card in cards) {
      cardGroup[card.value] = cardGroup[card.value]! + 1;
    }
    return cardGroup.values.where((element) => element == 2).length == 2;
  }

  bool isOnePair(List<CardModel> cards) {
    Map<int, int> cardGroup = {
      0: 0,
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
      13: 0,
    };

    for (CardModel card in cards) {
      cardGroup[card.value] = cardGroup[card.value]! + 1;
    }
    return cardGroup.values.contains(2);
  }

  void _showDialog(BuildContext context, bool correct, Hands handCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: correct
              ? const Text('Acertou', style: TextStyle(color: Colors.green))
              : Text("Errou\nresposta correta é: ${handCorrect.name}",
                  style: TextStyle(color: Colors.red)),
          actions: <Widget>[
            TextButton(
              child: const Text("Sortiar novas cartas"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
