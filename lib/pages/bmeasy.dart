import 'package:flutter/material.dart';
import 'dart:math';

import 'package:french_learning_ia/pages/test.dart';

var question = new Random ();
var noCorrect = 0;
var issoftwareCorrect;
var nosoftwareCorrect = 0;
var displaynosoftwareCorrect = nosoftwareCorrect.toString();
var counter = 0;
var accuracyDeterminer = new Random ();
var accuracyNumber = accuracyDeterminer.nextInt(20);
var element = question.nextInt(noQuestions);
var previous;
var expectedAnswer = answers.elementAt(element);
var howGood = 9;
var answers = ['etre','avoir','pouvoir','faire','mettre','dire','devoir','prendre','donner','aller','vouloir','savoir','etre','falloir','lire','finir','manger','prendre','regarder', 'voir', 'venir', 'suivre', 'parler', 'croire', 'aimer', 'passer', 'penser', 'attendre', 'trouver', 'laisser', 'arriver', 'donner', 'appeler', 'partir', 'mettre', 'rester', 'arreter', 'connaitre', 'demander', 'comprendre', 'sortir', 'entendre', 'chercher', 'aider', 'essayer', 'revenir', 'jouer', 'finir', 'perdre', 'sentir','to be','to have','to be able to','to do','to put','to say','to have to','to take','to give','to go','to want','to know','to be','to have to','to read','to finish','to eat','to take','to look', 'to see', 'to come', 'to follow', 'to talk', 'to believe', 'to like', 'to pass', 'to think', 'to wait for', 'to find', 'to leave', 'to arrive', 'to give', 'to call', 'to go', 'to put', 'to stay', '	to stop', 'to know','to ask', 'to understand', 'to go out', 'to hear', 'to look for', 'to help', 'to try', 'to come back', 'to play', 'to finish', 'to lose', 'to smell',];
var questions = ['to be','to have','to be able to','to do','to put','to say','to have to','to take','to give','to go','to want','to know','to be','to have to','to read','to finish','to eat','to take','to look', 'to see', 'to come', 'to follow', 'to talk', 'to believe', 'to like', 'to pass', 'to think', 'to wait for', 'to find', 'to leave', 'to arrive', 'to give', 'to call', 'to go', 'to put', 'to stay', '	to stop', 'to know','to ask', 'to understand', 'to go out', 'to hear', 'to look for', 'to help', 'to try', 'to come back', 'to play', 'to finish', 'to lose', 'to smell','etre','avoir','pouvoir','faire','mettre','dire','devoir','prendre','donner','aller','vouloir','savoir','etre','falloir','lire','finir','manger','prendre','regarder', 'voir', 'venir', 'suivre', 'parler', 'croire', 'aimer', 'passer', 'penser', 'attendre', 'trouver', 'laisser', 'arriver', 'donner', 'appeler', 'partir', 'mettre', 'rester', 'arreter', 'connaitre', 'demander', 'comprendre', 'sortir', 'entendre', 'chercher', 'aider', 'essayer', 'revenir', 'jouer', 'finir', 'perdre', 'sentir',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 100;
var displayNoCorrect = noCorrect.toString();
var winnerStatus = 'Waiting to start battle...';
var displayNumberQ = counter.toString();
var softwareAnswer = "Waiting for answer...";
var wrong;

class EasyBM extends StatefulWidget {
  @override
  _EasyBMState createState() => _EasyBMState();
  void initState () {

  }
}

class _EasyBMState extends State<EasyBM> {
  String word = questions.elementAt(element);
  String answer;
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: Text(
          'Battle Mode - Easy',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/bm');
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Center(
                child: Text(
                  "Question : What is the equivalent of '$word' ?",
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
              child: Center(
                child: Text(
                  'Answer:',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "Enter Answer Here...",
              ),
              onSubmitted: (answer){
              },
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Center(
                child: Text(
                  "Answer Status : $answerMessage",
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Player Score: $displayNoCorrect",
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Software Answer: $softwareAnswer",
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Software Score: $displaynosoftwareCorrect",
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Winning Status: $winnerStatus",
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
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  "Questions Answered: $displayNumberQ",
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Center(
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Check Answer.',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      answer = myController.text;
                      isCorrect = (answer == expectedAnswer);
                      answerMessage = (isCorrect == true ) ?  "Correct!" : "Sorry, that answer was incorrect.\n The expected answer to this question was $expectedAnswer.";
                      if (isCorrect == true) {
                        setState(() {
                          noCorrect = noCorrect + 1;
                          displayNoCorrect = noCorrect.toString();
                        });
                      }
                      accuracyNumber = accuracyDeterminer.nextInt(20);
                      if (accuracyNumber >= 0 && accuracyNumber <= howGood) {
                        setState(() {
                          issoftwareCorrect = true;
                        });
                      }
                      if (accuracyNumber >= (howGood+1) && accuracyNumber <= 20) {
                        setState(() {
                          issoftwareCorrect = false;
                        });
                      }
                      if (issoftwareCorrect == true) {
                          setState(() {
                            nosoftwareCorrect = nosoftwareCorrect + 1;
                            displaynosoftwareCorrect = nosoftwareCorrect.toString();
                            softwareAnswer = answers[element];
                          });
                        }
                      else if (issoftwareCorrect == false) {
                        setState(() {
                          do {
                            wrong = question.nextInt(noQuestions);
                          } while (wrong == element);
                          softwareAnswer = answers[wrong];
                        });
                      }
                        if (nosoftwareCorrect == noCorrect) {
                          setState(() {
                            winnerStatus = 'Draw';
                          });
                        }
                        if (nosoftwareCorrect > noCorrect) {
                          setState(() {
                            winnerStatus = 'You are losing!';
                          });
                        }
                        if (nosoftwareCorrect < noCorrect) {
                          setState(() {
                            winnerStatus = 'You are winning!';
                          });
                        }
                      Future.delayed(const Duration(milliseconds: 2500), () {
                        setState(() {
                          previous = element;
                          do {
                            element = question.nextInt(noQuestions);
                          } while (previous == element);
                          expectedAnswer = answers.elementAt(element);
                          word = questions[element];
                          answerMessage = "Waiting for response....";
                          softwareAnswer = "Waiting for answer...";
                        });
                      });
                      setState(() {
                        counter = counter + 1;
                        displayNumberQ = counter.toString();
                      });
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 30.0,
                  child: RaisedButton(
                      color: Colors.white,
                      child: Text(
                        'Return to Home.',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        setState(() {
                          nosoftwareCorrect = 0;
                          noCorrect = 0;
                          counter = 0;
                          answerMessage = "Waiting for response....";
                          winnerStatus = 'Waiting to start battle...';
                          displaynosoftwareCorrect = nosoftwareCorrect.toString();
                          displayNoCorrect = noCorrect.toString();
                          displayNumberQ = counter.toString();
                        });
                        Navigator.pushReplacementNamed(context, '/');
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
