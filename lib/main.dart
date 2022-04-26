import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const Calculatrice());

class Calculatrice extends StatelessWidget {
  const Calculatrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculatrice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: Calculatrices(),
    );
  }
}

class Calculatrices extends StatefulWidget {
  const Calculatrices({Key? key}) : super(key: key);

  @override
  State<Calculatrices> createState() => _CalculatricesState();
}

class _CalculatricesState extends State<Calculatrices> {

  String  resultat = "0";
  String equation= "0";
  double equationInterfDim= 28;
  double resultInterfDim = 48;
  String expression = "";

  buttonPressed(String buttonText)
  {
    setState(() {

      if (buttonText == "C") {
        equationInterfDim = 28;
        resultInterfDim = 48;
        equation = "0";
        resultat = "0";

      } else if(buttonText == "⌫"){
        equationInterfDim = 48;
        resultInterfDim = 28;
        equation = equation.substring(0,equation.length - 1);

        if(equation ==""){
          equation = "0";
        }


      }else if(buttonText == "="){
        equationInterfDim = 28;
        resultInterfDim = 48;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷','/');


        try{
          Parser pacer = Parser();
          Expression express = pacer.parse(expression);

          ContextModel contextMode = ContextModel();
          resultat = '${express.evaluate(EvaluationType.REAL, contextMode)}';
        }catch(e){

          resultat = "impossible";
        }
      }else{
        //dimension de font calculatrice
        equationInterfDim = 27;
        resultInterfDim = 58;


        equation= equation+buttonText;



      if(equation == "0"){

        equation = buttonText;

         }else{

        equation= equation + buttonText;


        }
      }
      });
    }




        Widget buildButton(String buttonText, double buttonHeight, Color boutonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09 * buttonHeight,
      color: boutonColor,

        child:TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () { buttonPressed(buttonText);},

           child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),



    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("calculatrice V1")),
      body: Column(
        children: <Widget>[
          Container(

            /// configuration des nombres inscrits a dessus du clavier
            ///
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 15, 25, 0),
            child: Text(
            equation,
              style: TextStyle(fontSize: equationInterfDim),
            ),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
            child: Text(
              resultat,
              style: TextStyle(fontSize: resultInterfDim),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .7500,

                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C",1, Colors.amber.shade900),
                      buildButton("⌫",1, Colors.amber),
                      buildButton("÷",1, Colors.amber),
                    ]),
                    TableRow(children: [
                      buildButton("7",1, Colors.black38),
                      buildButton("8",1, Colors.black38),
                      buildButton("9",1, Colors.black38),
                    ]),
                    TableRow(children: [
                      buildButton("4",1, Colors.black38),
                      buildButton("5",1, Colors.black38),
                      buildButton("6",1, Colors.black38),
                    ]),
                    TableRow(children: [
                      buildButton("1",1, Colors.black38),
                      buildButton("2",1, Colors.black38),
                      buildButton("3",1, Colors.black38),
                    ]),
                    TableRow(children: [
                      buildButton(".",1, Colors.black38),
                      buildButton("0",1, Colors.black38),
                      buildButton("00",1, Colors.black38),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(children: [
                  TableRow(children: [
                    buildButton("×",1, Colors.amber),
                  ]),
                  TableRow(children: [
                    buildButton("-",1, Colors.amber),
                  ]),
                  TableRow(children: [
                    buildButton("+",1, Colors.amber),
                  ]),
                  TableRow(children: [
                    buildButton("=",2, Colors.red),
                  ]),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }


}


