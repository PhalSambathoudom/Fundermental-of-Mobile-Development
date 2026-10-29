import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.grey[300],
        child: Column(children: [
          // Object 1: OOP
          Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text('OOP',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      )))),

          const SizedBox(height: 20),

          // Object 2: DART
          Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text('DART',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          decoration: TextDecoration.none)))),

          const SizedBox(height: 20),

          //Object3
          Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade600,
                  ])),
              child: Center(
                child: Text('FLUTTER',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    )),
              ))
        ]),
      ),
    ),
  );
}
