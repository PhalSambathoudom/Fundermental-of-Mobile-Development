import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.blue[300],
        margin: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[600], borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    ),
  );
}
