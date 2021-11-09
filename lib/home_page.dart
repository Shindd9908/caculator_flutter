import 'package:caculator_flutter/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  dynamic displaytxt = 20;

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 30,
            color: txtcolor,
          ),
        ),
        shape: const CircleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStyles.appName,
            style: AppStyles.h1.copyWith(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Caculator display
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 100),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //buttons functions
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('+/-', Colors.grey, Colors.black),
                    calcbutton('%', Colors.grey, Colors.black),
                    calcbutton('/', Colors.amber.shade700, Colors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //copy row
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //buttons functions
                    calcbutton('7', Colors.grey.shade800, Colors.white),
                    calcbutton('8', Colors.grey.shade800, Colors.white),
                    calcbutton('9', Colors.grey.shade800, Colors.white),
                    calcbutton('X', Colors.amber.shade700, Colors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //new row
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //buttons functions
                    calcbutton('4', Colors.grey.shade800, Colors.white),
                    calcbutton('5', Colors.grey.shade800, Colors.white),
                    calcbutton('6', Colors.grey.shade800, Colors.white),
                    calcbutton('-', Colors.amber.shade700, Colors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //new row
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //buttons functions
                    calcbutton('1', Colors.grey.shade800, Colors.white),
                    calcbutton('2', Colors.grey.shade800, Colors.white),
                    calcbutton('3', Colors.grey.shade800, Colors.white),
                    calcbutton('+', Colors.amber.shade700, Colors.white),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //now last row is differnent as it has 0 button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //This is button 0
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                    onPressed: () {
                      //button function
                      calculation('0');
                    },
                    shape: const StadiumBorder(),
                    child: const Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.grey.shade800,
                  ),
                  calcbutton('.', Colors.grey.shade800, Colors.white),
                  calcbutton('=', Colors.amber.shade700, Colors.white),
                ],
              )
            ],
          ),
        ));
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'X') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'X' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
