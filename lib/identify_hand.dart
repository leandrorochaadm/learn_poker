import 'package:flutter/material.dart';

import 'card_model.dart';
import 'hand_enum.dart';
import 'suits_enum.dart';

class Hand {
  final List<CardModel> cards;
  final String type;

  Hand({
    required this.cards,
    required this.type,
  });

  showCards() => "${cards.map((card) => "$card ").toList()}";
}

class IdentifyHand extends StatefulWidget {
  IdentifyHand({Key? key}) : super(key: key);

  List<CardModel> cardInTable = [];
  List<Hand> hands = [];

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final List<CardModel> hand =
                  await Navigator.pushNamed(context, 'keyboardHand')
                      as List<CardModel>;
              // print(hand);
              if (hand.length != 5) {
                _showDialog(
                    context: context,
                    message: 'É necessário ter 5 cartas.\nTente novamente.');
              } else {
                setState(() {
                  widget.cardInTable = hand;
                });
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Carta na mesa',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.cardInTable
                    .map((card) => Text(
                          card.toString(),
                          style: const TextStyle(fontSize: 25),
                        ))
                    .toList()),
          ),
          ElevatedButton(
            onPressed: () async {
              final List<CardModel> cardsHand =
                  await Navigator.pushNamed(context, 'keyboardHand')
                      as List<CardModel>;

              if (widget.cardInTable.length != 5) {
                _showDialog(
                    context: context,
                    message: 'É necessário lançar as cartas da mesma primeiro');
              } else if (cardsHand.length != 2) {
                _showDialog(
                    context: context,
                    message: 'É necessário ter 2 cartas.\nTente novamente.');
              } else {
                final List<CardModel> cards = [
                  ...cardsHand,
                  ...widget.cardInTable
                ];
                print(cards);
                final type = checkHand(cards);
                print(type);
                // const type = Hands.high_card;
                final hand = Hand(cards: cardsHand, type: "$type");
                setState(() {
                  widget.hands = [...widget.hands, hand];
                });
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Carta na mão',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.hands.length,
            itemBuilder: (context, index) {
              final hand = widget.hands[index];
              return ListTile(
                title: Text(
                  // "${hand.showCards()} ${hand.type}",
                  "${hand.showCards()}",
                  style: const TextStyle(fontSize: 25),
                ),
                subtitle: Text(
                  hand.type,
                  style: const TextStyle(fontSize: 25),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.hands.removeAt(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Hands checkHand(List<CardModel> cards) {
    if (isRoyalFlush(cards)) {
      return Hands.royal_flush;
    }
    if (isStraightFlush(cards)) {
      return Hands.straight_flush;
    }
    if (isFourKind(cards)) {
      return Hands.four_of_a_kind;
    }
    if (isFullHouse(cards)) {
      return Hands.full_house;
    }
    if (isFlush(cards)) {
      return Hands.flush;
    }
    if (isStraight(cards)) {
      return Hands.straight;
    }
    if (isThreeOfAKind(cards)) {
      return Hands.three_of_a_kind;
    }
    if (isTwoPair(cards)) {
      return Hands.two_pair;
    }
    if (isOnePair(cards)) {
      return Hands.one_pair;
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

    bool royal = cardGroup[9]! >= 1 &&
        cardGroup[10]! >= 1 &&
        cardGroup[11]! >= 1 &&
        cardGroup[12]! >= 1 &&
        cardGroup[13]! >= 1;

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
    return isOnePair(cards) && isThreeOfAKind(cards);
  }

  bool isFlush(List<CardModel> cards) {
    Suits firstSuit = cards[0].suit;
    return cards.where((element) => element.suit == firstSuit).length >= 5;
  }

  bool isStraight(List<CardModel> cards) {
    cards.sort((a, b) => a.value.compareTo(b.value));
    List<bool> resul = [];
    for (int i = 0; i < cards.length - 1; i++) {
      resul.add((cards[i + 1].value - cards[i].value) == 1);
      // print("${cards[i + 1].toString()}${cards[i].toString()}${resul}");
    }

    return resul.where((element) => element == true).length >= 5;
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
    return cardGroup.values.where((element) => element == 2).length >= 2;
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
    return cardGroup.values.where((element) => element == 2).length == 1;
  }

  void _showDialog({required String message, required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(message)),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
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
