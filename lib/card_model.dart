import 'package:aprenda_poker/suits_enum.dart';

class CardModel {
  CardModel({required this.imgName, required this.value, required this.suit});

  // https://cardmeister.github.io/
  String imgName;
  int value;
  Suits suit;
}
