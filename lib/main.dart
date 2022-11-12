// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator_app/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late dynamic firstNum;
  late dynamic secondNum;
  late dynamic textToDisplay = '';
  late dynamic history = '';
  late dynamic res;
  late dynamic operation;

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = double.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = double.parse(textToDisplay);
      if (operation == '+') {
        add();
      }
      secondNum = double.parse(textToDisplay);
      if (operation == '-') {
        subtract();
      }
      secondNum = double.parse(textToDisplay);
      if (operation == 'x') {
        multiply();
      }
      secondNum = double.parse(textToDisplay);
      if (operation == '/') {
        divide();
      }
    } else if (btnVal == '.') {
      if (!res.toString().contains('.')) {
        res = res.toString() + '.';
      }
      textToDisplay = res;
    } else {
      res = (textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  String doesContainDecimal(dynamic res) {
    if (res.toString().contains('.')) {
      List<String> splitDecimal = res.toString().split('.');
      if (!(double.parse(splitDecimal[1]) > 0)) {
        return res = splitDecimal[0].toString();
      }
    }
    return res;
  }

  String add() {
    res = doesContainDecimal((firstNum + secondNum).toString());
    history = doesContainDecimal(firstNum.toString()) +
        operation.toString() +
        doesContainDecimal(secondNum.toString());
    return doesContainDecimal(res);
  }

  String subtract() {
    res = doesContainDecimal((firstNum - secondNum).toString());
    history = doesContainDecimal(firstNum.toString()) +
        operation.toString() +
        doesContainDecimal(secondNum.toString());
    return doesContainDecimal(res);
  }

  String multiply() {
    res = doesContainDecimal((firstNum * secondNum).toString());
    history = doesContainDecimal(firstNum.toString()) +
        operation.toString() +
        doesContainDecimal(secondNum.toString());
    return doesContainDecimal(res);
  }

  String divide() {
    res = doesContainDecimal((firstNum / secondNum).toString());
    history = doesContainDecimal(firstNum.toString()) +
        operation.toString() +
        doesContainDecimal(secondNum.toString());
    return doesContainDecimal(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
        ),
        backgroundColor: Color.fromARGB(255, 187, 200, 207), // AppBar
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(children: <Widget>[
              Expanded(child: Divider()),
            ]),
            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 48,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: 'AC',
                  fillColor: 0xFF4CAF50,
                  textColor: 0xFF000000,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: 'C',
                  fillColor: 0xFF66BB6A,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '<',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '/',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '9',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '7',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: 'x',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '6',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '4',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '3',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '1',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '0',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 28,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '00',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '.',
                  fillColor: 0xFF64B5F6,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFFFFA726,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callBack: btnOnClick,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
