import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/design.dart';

String resultText = "Normal";
double resultNumber = 20.5;
String resultDescription = "You have a normal body weight";

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI Calculator",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF00838F),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              color: inactiveColor,
              child: Column(
                children: [
                  Text(resultText),
                  Text(
                    resultNumber.toString(),
                  ),
                  Text(resultDescription),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
