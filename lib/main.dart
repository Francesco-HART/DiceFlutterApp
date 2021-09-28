import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  final DicePage dicePage = new DicePage();
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: dicePage,
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Random random = new Random();
  int leftButton = 1;
  int rigthButton = 1;
  int min = 1, max = 6;

  void setLeftButton() {
    setState(() {
      leftButton = min + random.nextInt(max - min);
    });
  }

  void setRigthButton() {
    setState(() {
      rigthButton = min + random.nextInt(max - min);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {
                setRigthButton();
              },
              child: Image(
                alignment: Alignment.center,
                image: AssetImage('images/dice$rigthButton.png'),
              ),
            )),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setLeftButton();
                },
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/dice$leftButton.png'),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              setLeftButton();
              setRigthButton();
            },
            child: const Icon(Icons.play_circle),
            backgroundColor: Colors.red[400],
          ),
        )
      ]),
    );
  }
}
