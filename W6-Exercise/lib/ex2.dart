import 'dart:ui' show Color;

import 'package:flutter/material.dart';

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  ButtonType(this.color);
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon, size: 18, color: Colors.black),
            SizedBox(width: 20),
            Text(label, style: TextStyle(color: Colors.black, fontSize: 18)),
          ],

          if (iconPosition == IconPosition.right) ...[
            Text(label, style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(width: 20),
            Icon(icon, size: 18, color: Colors.black),
          ],
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: const Text(
            'Custom buttons',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(label: 'Submit', icon: Icons.check),
                  CustomButton(
                    label: 'Time',
                    icon: Icons.timer,
                    iconPosition: IconPosition.right,
                    buttonType: ButtonType.secondary,
                  ),
                  CustomButton(
                    label: 'Account',
                    icon: Icons.cabin,
                    iconPosition: IconPosition.right,
                    buttonType: ButtonType.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
