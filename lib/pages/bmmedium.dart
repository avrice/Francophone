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
var howGood = 14;
var softwareAnswer = "Waiting for answer...";
var wrong;
var questions = ['rentrer', 'vivre', 'rendre', 'tenir', 'oublier', 'travailler', 'manger', 'entrer', 'devenir', 'commencer', 'payer', 'tirer', 'ouvrir', 'changer', 'excuser', 'dormir', 'occuper', 'marcher', 'envoyer', 'apprendre', 'boire', 'garder', 'montrer', 'asseoir', 'porter', 'prier', 'servir', 'écrire', 'retrouver', 'gagner', 'acheter', 'rappeler', 'lire', 'monter', 'quitter', 'emmener', 'toucher', 'continuer', 'raconter', 'repondre', 'sauver', 'rencontrer', 'fermer', 'valoir', 'compter', 'bouger', 'apporter', 'décider', 'vendre', 'expliquer','to bring in','to live','to return','to hold','to forget','to work','to eat','to go in','to become','to start','to pay','to pull','to open','to change','to forgive','to sleep','to occupy','to walk','to send','to learn','to drink','to look after','to show','to sit down','to carry','to pray','to serve','to write','to find', 'to win', 'to buy', 'to remind', 'to read', 'to go up', 'to leave', 'to take', 'to touch', 'to continue', 'to tell', 'to answer', 'to save', 'to meet', 'to close', 'to hold', 'to count', 'to move', 'to bring', 'to decide', 'to sell', 'to explain',];
var answers = ['to bring in','to live','to return','to hold','to forget','to work','to eat','to go in','to become','to start','to pay','to pull','to open','to change','to forgive','to sleep','to occupy','to walk','to send','to learn','to drink','to look after','to show','to sit down','to carry','to pray','to serve','to write','to find', 'to win', 'to buy', 'to remind', 'to read', 'to go up', 'to leave', 'to take', 'to touch', 'to continue', 'to tell', 'to answer', 'to save', 'to meet', 'to close', 'to hold', 'to count', 'to move', 'to bring', 'to decide', 'to sell', 'to explain','rentrer', 'vivre', 'rendre', 'tenir', 'oublier', 'travailler', 'manger', 'entrer', 'devenir', 'commencer', 'payer', 'tirer', 'ouvrir', 'changer', 'excuser', 'dormir', 'occuper', 'marcher', 'envoyer', 'apprendre', 'boire', 'garder', 'montrer', 'asseoir', 'porter', 'prier', 'servir', 'écrire', 'retrouver', 'gagner', 'acheter', 'rappeler', 'lire', 'monter', 'quitter', 'emmener', 'toucher', 'continuer', 'raconter', 'repondre', 'sauver', 'rencontrer', 'fermer', 'valoir', 'compter', 'bouger', 'apporter', 'décider', 'vendre', 'expliquer',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 100;
var displayNoCorrect = noCorrect.toString();
var winnerStatus = 'Waiting to start battle...';
var displayNumberQ = counter.toString();
class MediumBM extends StatefulWidget {
  @override
  _MediumBMState createState() => _MediumBMState();
  void initState () {

  }
}

class _MediumBMState extends State<MediumBM> {
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
          'Battle Mode - Medium',
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
