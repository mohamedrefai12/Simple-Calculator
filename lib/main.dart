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
  double? third;
  String operator = '';
  String theEqual = '';
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
                flex: 2,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(24),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      displayText,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
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
                                    third = null;
                                    theEqual = '';
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
                          ),
                          buildButton('E'),
                          buildButton('/'),
                          //buildButton('x'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildButton('7'),
                          buildButton('8'),
                          buildButton('9'),
                          buildButton('x'),
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
                          buildButton('-'),
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
                          buildButton('+'),
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
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
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
                                    theEqual = '=';
                                    if (operator == '+' && third == null) {
                                      secondNumber = double.parse(displayText);
                                      third = firstNumber + secondNumber;
                                      //firstNumber = third;
                                      displayText = third.toString();
                                    } else if (operator == '+' &&
                                        third == double.parse(displayText)) {
                                      firstNumber = double.parse(displayText);
                                      third = firstNumber + secondNumber;
                                      displayText = third.toString();
                                    } else if (operator == '-' &&
                                        third == null) {
                                      secondNumber = double.parse(displayText);
                                      third = firstNumber - secondNumber;
                                      //firstNumber = third;
                                      displayText = third.toString();
                                    } else if (operator == '-' &&
                                        third == double.parse(displayText)) {
                                      firstNumber = double.parse(displayText);
                                      third = firstNumber - secondNumber;
                                      displayText = third.toString();
                                    } else if (operator == 'x' &&
                                        third == null) {
                                      secondNumber = double.parse(displayText);
                                      third = firstNumber * secondNumber;
                                      //firstNumber = third;
                                      displayText = third.toString();
                                    } else if (operator == 'x' &&
                                        third == double.parse(displayText)) {
                                      firstNumber = double.parse(displayText);
                                      third = firstNumber * secondNumber;
                                      displayText = third.toString();
                                    } else if (operator == '/' &&
                                        third == null) {
                                      secondNumber = double.parse(displayText);
                                      third = firstNumber / secondNumber;
                                      //firstNumber = third;
                                      displayText = third.toString();
                                    } else if (operator == '/' &&
                                        third == double.parse(displayText)) {
                                      firstNumber = double.parse(displayText);
                                      third = firstNumber / secondNumber;
                                      displayText = third.toString();
                                    }
                                  });
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
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              if (buttonText == 'E') {
                // If there is more than 1 number, chop the last one off
                if (displayText.length > 1) {
                  displayText = displayText.substring(
                    0,
                    displayText.length - 1,
                  );
                }
                // If there is only 1 number left, reset it back to '0'
                else {
                  displayText = '0';
                }
              }
              //check operator
              else if (buttonText == '+' ||
                  buttonText == '-' ||
                  buttonText == 'x' ||
                  buttonText == '/') {
                operator = buttonText;
                firstNumber = double.parse(displayText);
                displayText = '0';
                third = null;
                theEqual = '';
              }
              // 2. ONLY run this if it was NOT the 'E' button
              else {
                if (displayText == '0') {
                  displayText = buttonText;
                } else if (buttonText == '.' && displayText.contains('.')) {
                  return;
                } else if (theEqual == '=') {
                  displayText = buttonText;
                  theEqual = '';
                } else {
                  displayText = displayText + buttonText;
                }
              }
            });
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
