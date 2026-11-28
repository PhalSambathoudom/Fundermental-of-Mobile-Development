import 'package:flutter/material.dart';

class ClickedButton extends StatefulWidget {
  const ClickedButton({super.key});

  @override
  State<ClickedButton> createState() => _ClickedButtonState();
}

class _ClickedButtonState extends State<ClickedButton> {
  bool isSelected = false;
  String get textLabel => isSelected ? 'selected' : 'not selected';
  dynamic get textColor => isSelected ? Colors.white : Colors.black;
  dynamic get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Text(textLabel, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            ClickedButton(),
            ClickedButton(),
            ClickedButton(),
            ClickedButton(),
          ],
        ),
      ),
    ),
  ),
);
