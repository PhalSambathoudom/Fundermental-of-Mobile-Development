import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          body: Column(
    children: [
      SizedBox(height: 100),
      SizedBox(
        height: 400,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Container(
              width: 100,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
      SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: 100,
              color: Colors.green,
            )),
            Container(
                width: 100, color: const Color.fromARGB(255, 240, 47, 224)),
          ],
        ),
      ),
      SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(child: Container(color: Colors.amber)),
            SizedBox(width: 20),
            Expanded(child: Container(color: Colors.amber)),
            SizedBox(width: 20),
            Expanded(child: Container(color: Colors.amber))
          ],
        ),
      ),
      SizedBox(height: 20),
      Expanded(child: Container(color: const Color.fromARGB(255, 240, 47, 224)))
    ],
  ))));
}
