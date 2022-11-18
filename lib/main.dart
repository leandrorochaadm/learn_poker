import 'package:aprenda_poker/home_page.dart';
import 'package:aprenda_poker/identify_hand.dart';
import 'package:aprenda_poker/which_hand_page.dart';
import 'package:flutter/material.dart';

import 'keyboard_hand.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aprenda poker Texas Hold'em",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const HomePage(),
        'whichHand': (BuildContext context) => const WhichHandPage(),
        'identifyHand': (BuildContext context) => IdentifyHand(),
        'keyboardHand': (BuildContext context) => KeyboardHand(),
      },
      initialRoute: 'home',
      home: const HomePage(),
    );
  }
}
