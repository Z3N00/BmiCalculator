import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'design.dart';
import 'screen/result.dart';

int height = 170;
int weight = 75;
int age = 20;

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = inactiveColor;
      }
    }

    //female card pressed
    if (gender == 2) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: reusableContainer(
                        cardChild: iconwidget(
                          reusableIcon: FontAwesomeIcons.venus,
                          iconlabel: 'Male',
                        ),
                        backGroundColor: maleCardColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: reusableContainer(
                        backGroundColor: femaleCardColor,
                        cardChild: iconwidget(
                          reusableIcon: FontAwesomeIcons.venus,
                          iconlabel: 'Female',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: reusableContainer(
                backGroundColor: inactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Height",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberHeight,
                        ),
                        Text(
                          "CM",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      onChanged: (double changeHeight) {
                        setState(() {
                          height = changeHeight.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: reusableContainer(
                      backGroundColor: inactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Weight",
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buttonPlusminus(
                                iconPlusminus: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              buttonPlusminus(
                                iconPlusminus: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: reusableContainer(
                      backGroundColor: inactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buttonPlusminus(
                                iconPlusminus: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              buttonPlusminus(
                                iconPlusminus: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: activeColor,
              height: 80.0,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new result(),
                    ),
                  );
                },
                child: Text(
                  "Click",
                  style: btnHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}

class buttonPlusminus extends StatelessWidget {
  buttonPlusminus(
      {Key? key, required this.iconPlusminus, required this.onPress});

  final IconData iconPlusminus;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: activeColor,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 44.0,
        height: 44.0,
      ),
      child: Icon(iconPlusminus),
    );
  }
}

class iconwidget extends StatelessWidget {
  iconwidget({required this.reusableIcon, required this.iconlabel});

  final IconData reusableIcon;
  final String iconlabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(reusableIcon, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(iconlabel, style: btnHeight),
      ],
    );
  }
}

class reusableContainer extends StatelessWidget {
  const reusableContainer(
      {required this.backGroundColor, required this.cardChild});

  final Color backGroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardChild,
    );
  }
}
