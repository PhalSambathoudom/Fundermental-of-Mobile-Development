import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 75,
            backgroundColor: Colors.deepOrangeAccent,
            title: Center(
              child: Text('Welcome !',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            )),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text('My hobbies',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(left: 50),
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Soccer',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                )),
                Expanded(
                    child: Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(left: 50),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Flutter',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ))
              ],
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              height: 100,
              child: Container(
                color: Colors.deepOrangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
