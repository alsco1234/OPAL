import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opalapp/screens/disabled/Flexibility/Flexibility_pullNeck.dart';
import 'Flexibility_SpreadArms.dart';
import 'Flexibility_Squeeze.dart';
import 'Flexibility_backWaist.dart';
import 'Flexibility_breathing.dart';
import 'Flexibility_diagonalNeck.dart';
import 'Flexibility_elbowsBackhead.dart';
import 'Flexibility_elbowsToBody.dart';
import 'Flexibility_pullNeckSide.dart';

class flexibility_page extends StatefulWidget {
  @override
  _flexibility_pageState createState() => _flexibility_pageState();
}

class _flexibility_pageState extends State<flexibility_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/pullNeckSide': (context) => SecondScreen(),
        '/diagonalNeck': (context) => ThirdScreen(),
        '/spreadArms': (context) => FourthScreen(),
        '/elbowsToBody': (context) => FifthScreen(),
        '/elbowsBackhead': (context) => SixthScreen(),
        '/squeeze': (context) => SeventhScreen(),
        '/backWaist': (context) => EighthScreen(),
        '/breathing': (context) => LastScreen(),
      }, //지금은 필요가 없는 부분
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_pullNeck(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_pullNeckSide(),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_diagonalNeck(),
    );
  }
}
class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_spreadArms(),
    );
  }
}
class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_elbowsToBody(),
    );
  }
}
class SixthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_elbowsBackhead(),
    );
  }
}

class SeventhScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_squeeze(),
    );
  }
}

class EighthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_backWaist(),
    );
  }
}

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flexibility_breathing(),
    );
  }
}