import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _button(route: 'identifyHand', label: 'Descubra sua mão'),
          _button(route: 'whichHand', label: 'Treinar mão'),
          _button(route: 'rankingHand', label: 'Ranking das mãos'),
        ],
      ),
    );
  }
}

class _button extends StatelessWidget {
  final String route;
  final String label;

  const _button({
    Key? key,
    required this.route,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 180,
      height: 60,
      child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, route),
          child: Text(label)),
    );
  }
}
