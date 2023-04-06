import 'package:flutter/material.dart';
import 'dart:math';

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
var softwareAnswer = "Waiting for answer...";
var wrong;
var howGood = 18;
var questions = ['adorer','recevoir','utiliser','coucher','preferer','offrir','preparer','choisir','conduire','chanter','presenter','accepter','refuser', 'terminer','amuser','intéresser','rire','pardonner','embrasser','danser','detester','maintenir','supposer','epouser','approcher','craindre','crier','inviter','arranger','remercier','repeter','signer','accompagner','oser','permettre','annuler','laver','se plaindre','epeler','traduire','eteindre','allumer','se réveiller','ajouter','gouter','couter','cuire','décrire', 'effacer', 'enseigner','to adore','to receive','to use','to put to bed','to prefer','to offer','to prepare','to choose','to drive','to sing','to introduce','to accept','to refuse', 'to finish','to amuse','to interest','to laugh','to forgive','to kiss','to dance','to hate','to keep','to suppose','to marry','to approach','to fear','to shout','to invite','to arrange','to thank','to repeat','to sign','to go with','to dare','to allow','to cancel','to clean','to complain','to spell', 'to translate', 'to turn off','to turn on','to wake up','to add', 'to taste', 'to cost', 'to cook','to describe', 'to erase', 'to teach',];
var answers = ['to adore','to receive','to use','to put to bed','to prefer','to offer','to prepare','to choose','to drive','to sing','to introduce','to accept','to refuse', 'to finish','to amuse','to interest','to laugh','to forgive','to kiss','to dance','to hate','to keep','to suppose','to marry','to approach','to fear','to shout','to invite','to arrange','to thank','to repeat','to sign','to go with','to dare','to allow','to cancel','to clean','to complain','to spell', 'to translate', 'to turn off','to turn on','to wake up','to add', 'to taste', 'to cost', 'to cook','to describe', 'to erase', 'to teach','adorer','recevoir','utiliser','coucher','preferer','offrir','preparer','choisir','conduire','chanter','presenter','accepter','refuser', 'terminer','amuser','intéresser','rire','pardonner','embrasser','danser','detester','maintenir','supposer','epouser','approcher','craindre','crier','inviter','arranger','remercier','repeter','signer','accompagner','oser','permettre','annuler','laver','se plaindre','epeler','traduire','eteindre','allumer','se réveiller','ajouter','gouter','couter','cuire','décrire', 'effacer', 'enseigner',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 100;
var displayNoCorrect = noCorrect.toString();
var winnerStatus = 'Waiting to start battle...';
var displayNumberQ = counter.toString();
class HardBM extends StatefulWidget {
  @override
  _HardBMState createState() => _HardBMState();
  void initState () {

  }
}

class _HardBMState extends State<HardBM> {
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
          'Battle Mode - Hard',
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
                      accuracyNumber = accuracyDeterminer.nextInt(20);
                      answerMessage = (isCorrect == true ) ?  "Correct!" : "Sorry, that answer was incorrect.\n The expected answer to this question was $expectedAnswer.";
                      if (isCorrect == true) {
                        setState(() {
                          noCorrect = noCorrect + 1;
                          displayNoCorrect = noCorrect.toString();
                        });
                      }
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
