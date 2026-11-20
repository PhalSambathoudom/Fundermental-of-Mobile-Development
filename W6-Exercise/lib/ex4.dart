import 'package:flutter/material.dart';

enum Device {
  lamp(name: "Lamp", icon: Icons.lightbulb, room: "Bedroom"),
  tv(name: "TV", icon: Icons.tv, room: "Living room"),
  fan(name: "Fan", icon: Icons.air, room: "Office"),
  speaker(name: "Speaker", icon: Icons.speaker, room: "Kitchen"),
  heater(name: "Heater", icon: Icons.local_fire_department, room: "Bathroom"),
  camera(name: "Camera", icon: Icons.videocam, room: "Garage");

  const Device({required this.name, required this.icon, required this.room});

  final String name;
  final IconData icon;
  final String room;
}

//
//  Create your stateless widget DeviceCard here
//
//
class MyDeviceCard extends StatelessWidget {
  final Device device;
  final bool isOn;

  const MyDeviceCard({super.key, required this.device, required this.isOn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 198, 197, 197),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.directional(
              start: 25,
              end: 25,
              top: 5,
              bottom: 5,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: isOn ? Colors.amber : Colors.grey,
              ),
              child: Icon(device.icon, color: Colors.white),
            ),
          ),
          Text(device.name),
          Text(' - '),
          Text(device.room),
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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "EX-2 - Stateless Widgets",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          // REMOVE THIS CODE AND REPLACE WITH YOUR OWN CODE
          // We give here an example of CircleAvatar usage (with an icon)
          // child: CircleAvatar(
          //   radius: 25,
          //   backgroundColor: Colors.grey,
          //   child: Icon(Device.lamp.icon, color: Colors.white),
          // ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyDeviceCard(device: Device.lamp, isOn: false),
              SizedBox(height: 16),
              MyDeviceCard(device: Device.tv, isOn: true),
              SizedBox(height: 16),
              MyDeviceCard(device: Device.fan, isOn: false),
            ],
          ),
        ),
      ),
    ),
  );
}
