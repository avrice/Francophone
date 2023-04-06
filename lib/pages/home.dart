import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/easytest.dart';
import 'package:french_learning_ia/pages/eta.dart';
import 'package:french_learning_ia/pages/hardtest.dart';
import 'package:french_learning_ia/pages/hta.dart';
import 'package:french_learning_ia/pages/test.dart';
import 'package:french_learning_ia/pages/testA.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
const sep = 10.0;
const buttonsep = 15.0;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: Text(
            'Home Screen',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,sep),
              child: Text(
                'French To English:',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, buttonsep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Easy Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/et');
                    wordE = currentTestE.questionList[0];
                    expectedAnswerE = currentTestE.answersList[0];
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, buttonsep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Medium Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/test');
                    setState(() {
                      word = currentTest.questionList[0];
                      expectedAnswer = currentTest.answersList[0];
                    });
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,sep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Hard Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    wordH = currentTestH.questionList[0];
                    expectedAnswerH = currentTestH.answersList[0];
                    Navigator.pushReplacementNamed(context, '/ht');
                  },
                ),
              ),
            ),
          ),
          Center(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,sep),
              child: Text(
                'English To French:',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, buttonsep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Easy Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    wordEA = currentTestEA.questionList[0];
                    expectedAnswerEA = currentTestEA.answersList[0];
                    Navigator.pushReplacementNamed(context, '/eta');
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, buttonsep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Medium Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/testA');
                    wordA = currentTestA.questionList[0];
                    expectedAnswerA = currentTestA.answersList[0];
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,sep),
              child: ButtonTheme(
                minWidth: 245.0,
                height: 30.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Take A New Hard Level Test.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    wordHA = currentTestHA.questionList[0];
                    expectedAnswerHA = currentTestHA.answersList[0];
                    Navigator.pushReplacementNamed(context, '/hta');
                  },
                ),
              ),
            ),
          ),
          Center(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,sep),
              child: Text(
                'Battle Mode!',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: ButtonTheme(
              minWidth: 245.0,
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,sep),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Play Battle Mode!',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/bm');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
