import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    );
  }
}



        class DicePage extends StatefulWidget {
        @override
        _DicePageState createState() => _DicePageState();
        }

        class _DicePageState extends State<DicePage> {
          int leftDiceNumber = 1;
          int rightDiceNumber = 1;

          void rollDice() {
            setState(() {
              leftDiceNumber = Random().nextInt(6) + 1;
              rightDiceNumber = Random().nextInt(6) + 1;
            });
          }

          @override
          Widget build(BuildContext context) {
            return Center(
              // Background color of the screen
              child: Container(
                width: 200,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {

                          setState(() {
                            leftDiceNumber = Random().nextInt(5) + 1;
                          });
                        },
                        child: Image.asset('assets/images/img_$leftDiceNumber.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {

                          setState(() {
                            rightDiceNumber = Random().nextInt(5) + 1;
                          });
                        },
                        child: Image.asset('assets/images/img_$rightDiceNumber.png'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
