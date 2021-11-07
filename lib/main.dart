import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: reusableContainer(
                          cardChild: iconwidget(
                            reusableIcon: FontAwesomeIcons.venus,
                            iconlabel: 'Male',
                          ),
                          backGroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: reusableContainer(
                        backGroundColor: Colors.grey,
                        cardChild: iconwidget(
                          reusableIcon: FontAwesomeIcons.venus,
                          iconlabel: 'Female',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(
                      child: reusableContainer(
                        backGroundColor: Colors.grey,
                        cardChild: Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: reusableContainer(
                        backGroundColor: Colors.grey,
                        cardChild: Container(),
                      ),
                    ),
                    Expanded(
                      child: reusableContainer(
                        backGroundColor: Colors.grey,
                        cardChild: Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Colors.orange,
              height: 80.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
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
        Text(iconlabel, style: labelTextStyle),
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
      color: backGroundColor,
      child: cardChild,
    );
  }
}
