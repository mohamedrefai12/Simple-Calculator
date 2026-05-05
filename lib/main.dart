import 'package:flutter/material.dart';
import 'dart:math';

// main function is starting point of the app
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigo[800],
          title: const Text('Match'),
        ),
        body: Match(),
      ),
    ),
  );
}

class Match extends StatefulWidget {
  const Match({super.key});

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  int leftimage = 1;
  int rightimage = 2;
  int trys = 0;
  void button_1() {
    leftimage = Random().nextInt(8); //0-7
    trys++;
  }

  void button_2() {
    rightimage = Random().nextInt(8);
    trys++;
  }

  void check() {
    if (leftimage == rightimage) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              'You win',
            ),
            content: Text('you did it in $trys Tries'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    leftimage = 1;
                    rightimage = 2;
                    trys = 0;
                  });
                },
                child: Text('Play Again!'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftimage == rightimage ? 'Victory!' : "Match!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          'Number of Tries: $trys',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      button_1();
                      check();
                    });
                  },
                  child: Image.asset('assets/image-$leftimage.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      button_2();
                      check();
                    });
                  },
                  child: Image.asset('assets/image-$rightimage.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
