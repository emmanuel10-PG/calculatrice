


import 'package:flutter/material.dart';

void main() {
  runApp(calculatrice());
}

class calculatrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculatrice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: calculatrices(),
    );
  }
}

class calculatrices extends StatefulWidget {

//  const calculatrices({Key? key}) : super(key: key);

  @override
  State<calculatrices> createState() => _calculatricesState();
}

class _calculatricesState extends State<calculatrices>{


  Widget buildButton(String buttonText, double buttonHeight, Color boutonColor){


    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: boutonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.blueAccent,
                width: 1,
                style: BorderStyle.solid
            )

        ),
        padding: EdgeInsets.all(16.0),
        onPressed: null,
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight:  FontWeight.bold,
              color: Colors.white,

          ),
        ),

      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("calculatrice V1")),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 25, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 40.0),
            ),

          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(15, 25, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Expanded(
            child: Diviser(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .60,
                child: Table(
                  children: [
                    TableRow(
                        children: [

                          buildButton("C",1, Colors.greenAccent),
                          buildButton("⌫",1, Colors.greenAccent),
                          buildButton("÷",1, Colors.greenAccent),

                    ]),
                    TableRow(
                        children: [

                          buildButton("1",1, Colors.greenAccent),
                          buildButton("2",1, Colors.greenAccent),
                          buildButton("3",1, Colors.greenAccent),

                        ]),
                    TableRow(
                        children: [

                          buildButton("4",1, Colors.greenAccent),
                          buildButton("5",1, Colors.greenAccent),
                          buildButton("6",1, Colors.greenAccent),

                        ]),
                    TableRow(
                        children: [

                          buildButton("1",1, Colors.greenAccent),
                          buildButton("2",1, Colors.greenAccent),
                          buildButton("3",1, Colors.greenAccent),

                        ]),
                    TableRow(
                        children: [

                          buildButton(".",1, Colors.greenAccent),
                          buildButton("0",1, Colors.greenAccent),
                          buildButton("00",1, Colors.greenAccent),

                        ]),
                    TableRow(
                        children: [

                          buildButton("C",1, Colors.greenAccent),
                          buildButton("⌫",1, Colors.greenAccent),
                          buildButton("÷",1, Colors.greenAccent),

                        ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

