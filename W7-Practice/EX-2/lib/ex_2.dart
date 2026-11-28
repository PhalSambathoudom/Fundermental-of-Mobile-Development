import 'package:flutter/material.dart';

class FavouriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavouriteCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool isFavourite = false;

  Icon iconColor() {
    if (isFavourite) {
      return const Icon(Icons.favorite, color: Colors.red);
    } else {
      return const Icon(Icons.favorite_border, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.brown.shade300)),
      ),
      // YOUR CODE
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: TextStyle(color: Colors.blue)),
                const SizedBox(height: 5),
                Text(widget.description, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            icon: iconColor(),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavouriteCard(title: 'Love', description: 'I love Ronan!'),
          FavouriteCard(title: 'The Best', description: 'Ronan is the best'),
          FavouriteCard(title: 'Coding', description: 'I love Coding'),
        ],
      ),
    ),
  ),
);
