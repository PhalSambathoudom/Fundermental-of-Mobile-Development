import 'package:flutter/material.dart';

void main() {
  runApp(
    const  MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 213, 250),
        body: Center(
          child: Text(
            'Hello my name is Ronan !',
            style: TextStyle(
              fontSize: 50,
              color: Colors.amber,
            ),
          ),
        )
      ),
    ),
  );
}
