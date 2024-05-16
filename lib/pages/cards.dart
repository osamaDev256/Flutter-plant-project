import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 160,
        width: 100,
        color: const Color.fromARGB(255, 188, 188, 188),
      ),
    );
  }
}