import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: Text('Products', style: TextStyle(fontSize: 28)),
          toolbarHeight: 75,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/ex3/dart.png',
                        height: 100,
                        width: 100,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Dart', style: TextStyle(fontSize: 28)),
                        subtitle: Text('the best object language'),
                      ),
                    ],
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/ex3/dart.png',
                        height: 100,
                        width: 100,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text('Dart', style: TextStyle(fontSize: 28)),
                        subtitle: Text('the best object language'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
