import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aprenda poker Texas Hold'em",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const SizedBox(),
    );
  }
}
