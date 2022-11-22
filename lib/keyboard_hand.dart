import 'package:flutter/material.dart';

import 'card_model.dart';
import 'suits_enum.dart';

class KeyboardHand extends StatefulWidget {
  KeyboardHand({Key? key}) : super(key: key);
  List<CardModel> display = [];

  @override
  State<KeyboardHand> createState() => _KeyboardHandState();
}

class _KeyboardHandState extends State<KeyboardHand> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, widget.display);
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Teclado de cartas'),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.display.isNotEmpty) {
                        widget.display.removeLast();
                      }
                    });
                  },
                  icon: const Icon(Icons.backspace))
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 48,
                child: Row(
                  children: widget.display
                      .map((CardModel chart) => Text(
                            chart.toString(),
                            style: const TextStyle(fontSize: 24),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  crossAxisCount: 4,
                  children: _cheapComplete()
                      .map((chat) => ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (!widget.display.contains(chat)) {
                                  widget.display = [...widget.display, chat];
                                }
                              });
                            },
                            child: Text(
                              chat.toString(),
                              style: const TextStyle(fontSize: 30),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<CardModel> _cheapComplete() {
    return [
      CardModel(label: "A", suit: Suits.clubs, value: 13),
      CardModel(label: "A", suit: Suits.diamonds, value: 13),
      CardModel(label: "A", suit: Suits.hearts, value: 13),
      CardModel(label: "A", suit: Suits.spades, value: 13),
      CardModel(label: "2", suit: Suits.clubs, value: 1),
      CardModel(label: "2", suit: Suits.diamonds, value: 1),
      CardModel(label: "2", suit: Suits.hearts, value: 1),
      CardModel(label: "2", suit: Suits.spades, value: 1),
      CardModel(label: "3", suit: Suits.clubs, value: 2),
      CardModel(label: "3", suit: Suits.diamonds, value: 2),
      CardModel(label: "3", suit: Suits.hearts, value: 2),
      CardModel(label: "3", suit: Suits.spades, value: 2),
      CardModel(label: "4", suit: Suits.clubs, value: 3),
      CardModel(label: "4", suit: Suits.diamonds, value: 3),
      CardModel(label: "4", suit: Suits.hearts, value: 3),
      CardModel(label: "4", suit: Suits.spades, value: 3),
      CardModel(label: "5", suit: Suits.clubs, value: 4),
      CardModel(label: "5", suit: Suits.diamonds, value: 4),
      CardModel(label: "5", suit: Suits.hearts, value: 4),
      CardModel(label: "5", suit: Suits.spades, value: 4),
      CardModel(label: "6", suit: Suits.clubs, value: 5),
      CardModel(label: "6", suit: Suits.diamonds, value: 5),
      CardModel(label: "6", suit: Suits.hearts, value: 5),
      CardModel(label: "6", suit: Suits.spades, value: 5),
      CardModel(label: "7", suit: Suits.clubs, value: 6),
      CardModel(label: "7", suit: Suits.diamonds, value: 6),
      CardModel(label: "7", suit: Suits.hearts, value: 6),
      CardModel(label: "7", suit: Suits.spades, value: 6),
      CardModel(label: "8", suit: Suits.clubs, value: 7),
      CardModel(label: "8", suit: Suits.diamonds, value: 7),
      CardModel(label: "8", suit: Suits.hearts, value: 7),
      CardModel(label: "8", suit: Suits.spades, value: 7),
      CardModel(label: "9", suit: Suits.clubs, value: 8),
      CardModel(label: "9", suit: Suits.diamonds, value: 8),
      CardModel(label: "9", suit: Suits.hearts, value: 8),
      CardModel(label: "9", suit: Suits.spades, value: 8),
      CardModel(label: "10", suit: Suits.clubs, value: 9),
      CardModel(label: "10", suit: Suits.diamonds, value: 9),
      CardModel(label: "10", suit: Suits.hearts, value: 9),
      CardModel(label: "10", suit: Suits.spades, value: 9),
      CardModel(label: "J", suit: Suits.clubs, value: 10),
      CardModel(label: "J", suit: Suits.diamonds, value: 10),
      CardModel(label: "J", suit: Suits.hearts, value: 10),
      CardModel(label: "J", suit: Suits.spades, value: 10),
      CardModel(label: "Q", suit: Suits.clubs, value: 11),
      CardModel(label: "Q", suit: Suits.diamonds, value: 11),
      CardModel(label: "Q", suit: Suits.hearts, value: 11),
      CardModel(label: "Q", suit: Suits.spades, value: 11),
      CardModel(label: "K", suit: Suits.clubs, value: 12),
      CardModel(label: "K", suit: Suits.diamonds, value: 12),
      CardModel(label: "K", suit: Suits.hearts, value: 12),
      CardModel(label: "K", suit: Suits.spades, value: 12),
    ];
  }
}
