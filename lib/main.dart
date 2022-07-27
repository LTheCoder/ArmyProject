import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Army Project',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Army Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double startspeed = 0.0;
  double startangle = 0.0;

  double distance(double speed, double angle) {
    angle = angle * 0.0174533;
    return (pow(speed, 2) * (sin(2 * angle)) / 9.8);
  }

  double groundspped(double speed, double angle) {
    angle = angle * 0.0174533;
    return speed * cos(angle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 200,
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Enter the angle',
              ),
              onChanged: (value) => startangle = double.parse(value),
            )),
        SizedBox(
            width: 200,
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Enter the speed',
              ),
              onChanged: (value) => startspeed = double.parse(value),
            )),
        //just space
        const SizedBox(
          height: 20,
        ),
        FlatButton(
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: Text(
                        "distance: ${distance(startspeed, startangle)}\n ground speed: ${groundspped(startspeed, startangle)}"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
            child: const Text('Calculate'))
      ])),
    );
  }
}
