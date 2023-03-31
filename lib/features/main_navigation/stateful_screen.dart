import 'package:flutter/material.dart';

class StateFulScreen extends StatefulWidget {
  const StateFulScreen({super.key});

  @override
  State<StateFulScreen> createState() => _StateFulScreenState();
}

class _StateFulScreenState extends State<StateFulScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks = _clicks + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_clicks',
            style: const TextStyle(fontSize: 30),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text('+'),
          )
        ],
      ),
    );
  }
}
