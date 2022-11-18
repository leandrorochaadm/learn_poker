import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'identifyHand'),
              child: const Text('Descubra sua mão')),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'whichHand'),
              child: const Text('Treinar mão')),
        ],
      ),
    );
  }
}
