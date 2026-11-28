import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  int imageIndex = 0;

  void prevImage() {
    setState(() {
      imageIndex = (imageIndex - 1 + images.length) % images.length;
    });
  }

  void nextImage() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: prevImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }
}

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
