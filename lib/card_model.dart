import 'package:aprenda_poker/suits_enum.dart';

class CardModel {
  CardModel({required this.label, required this.value, required this.suit});

  // https://cardmeister.github.io/
  // String imgName;
  String label;
  int value;
  Suits suit;

  String SuitIcon() {
    switch (suit) {
      case Suits.clubs:
        return '♣';
        break;
      case Suits.diamonds:
        return '♦';
        break;
      case Suits.hearts:
        return '♥';
        break;
      case Suits.spades:
        return '♠';
        break;
    }
  }
}
