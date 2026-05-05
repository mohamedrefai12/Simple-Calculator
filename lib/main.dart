import 'package:flutter/material.dart';

// main function is starting point of the app
void main() {
  runApp(
    const Calcletor(),
  );
}

class Calcletor extends StatefulWidget {
  const Calcletor({super.key});

  @override
  State<Calcletor> createState() => _CalcletorState();
}

class _CalcletorState extends State<Calcletor> {
  String displayText = '0';
  double firstNumber = 0;
  double secondNumber = 0;
  String operator = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    displayText,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('7'),
                          buildButton('8'),
                          buildButton('9'),
                          buildButton('/'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('4'),
                          buildButton('5'),
                          buildButton('6'),
                          buildButton('x'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('1'),
                          buildButton('2'),
                          buildButton('3'),
                          buildButton('-'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('0'),
                          buildButton('.'),
                          //buildButton('='),
                          //buildButton('X'),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  218,
                                  185,
                                  0,
                                ), // Button background color
                              ),
                              onPressed: () {
                                setState(() {
                                  displayText = '0';
                                  firstNumber = 0;
                                  secondNumber = 0;
                                  operator = '';
                                });
                                // Later, we will put the math logic here!
                                print('pressed');
                              },
                              child: Text(
                                'C',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  243,
                                  135,
                                  33,
                                ), // Button background color
                              ),
                              onPressed: () {
                                setState(() {
                                  displayText = '=';
                                });
                                // Later, we will put the math logic here!
                                print(displayText);
                              },
                              child: Text(
                                '=',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Adds a tiny gap between buttons
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              if (displayText == '0') {
                displayText = buttonText;
              } else {
                displayText = displayText + buttonText;
              }
            });
            // Later, we will put the math logic here!
            print('$displayText pressed');
          },
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
