import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 214, 97, 136),
        body: Center(
          child: Text(
            'Hello my name is Ronan!',
            style: TextStyle(
              fontSize: 50.00,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    ),
  );
}
