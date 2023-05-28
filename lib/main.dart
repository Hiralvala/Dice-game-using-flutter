import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade700,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red.shade700,
        ),
        body: Dicepage(),
      ),
    ),
  );
}

class Dicepage extends StatefulWidget {
  const Dicepage({super.key});

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 2;

  void changeDiceFace() {
    setState(() {
      //we can change image using setstate
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber =
          Random().nextInt(6) + 1; //that is used to change both dice
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          //image is too big so we can use expanded widget to set image
          Expanded(
            //textbutton added 8 px padding themselves but we want to add 16 px padding so padding widget is used.
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                //image as a button
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                  // print('right button is clicked');
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
          // Image(
          //   image: AssetImage('images/dice1.png'),
          // ),
        ],
      ),
    );
  }
}


//when you want to change anything like image or else than stateful class is used otherwise we can use stateless class
