import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String text;
  final IconData icones;
  final dynamic color;

  const HobbyCard({super.key, 
    required this.text,
    required this.icones,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Icon(icones, color: Colors.white),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 206, 235),
          title: Text(
            'My Hobbies',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              HobbyCard(text: 'Travelling', icones: Icons.travel_explore, color: Colors.green),
              HobbyCard(text: 'Skating', icones: Icons.skateboarding)
            ],
          ),
        ),
      ),
    ),
  );
}
