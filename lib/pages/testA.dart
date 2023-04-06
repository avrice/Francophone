
import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/score.dart';
import 'dart:math';
import 'package:french_learning_ia/services/F_O.dart';



var noCorrect = 0;
var counter = 0;
var NC;
var expectedAnswerA;
List<String> answersA = ['rentrer', 'vivre', 'rendre', 'tenir', 'oublier', 'travailler', 'manger', 'entrer', 'devenir', 'commencer', 'payer', 'tirer', 'ouvrir', 'changer', 'excuser', 'dormir', 'occuper', 'marcher', 'envoyer', 'apprendre', 'boire', 'garder', 'montrer', 'asseoir', 'porter', 'prier', 'servir', 'écrire', 'retrouver', 'gagner', 'acheter', 'rappeler', 'lire', 'monter', 'quitter', 'emmener', 'toucher', 'continuer', 'raconter', 'repondre', 'sauver', 'rencontrer', 'fermer', 'valoir', 'compter', 'bouger', 'apporter', 'décider', 'vendre', 'expliquer',];
List<String> questionsA = ['to bring in','to live','to return','to hold','to forget','to work','to eat','to go in','to become','to start','to pay','to pull','to open','to change','to forgive','to sleep','to occupy','to walk','to send','to learn','to drink','to look after','to show','to sit down','to carry','to pray','to serve','to write','to find', 'to win', 'to buy', 'to remind', 'to read', 'to go up', 'to leave', 'to take', 'to touch', 'to continue', 'to tell', 'to answer', 'to save', 'to meet', 'to close', 'to hold', 'to count', 'to move', 'to bring', 'to decide', 'to sell', 'to explain',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 50;
var displayNoCorrect;
var lastScore;
var myController = TextEditingController();
Quiz currentTestA =  quizGenerator(questionsA,answersA);
var answerA;
var wordA;
class Quiz {
  List<String> questionList;
  List<String> answersList;
  Quiz(List questionsList, List answersList){
    this.questionList = questionsList;
    this.answersList = answersList;
  }
}
Quiz quizGenerator (questions, answers) {
  final Set<int> indexS = Set();
  for (int i = 0; i <= 150; i++){
    indexS.add(Random().nextInt(noQuestions-1));
  }
  List<String> testQ = [], testA = [];
  List<int> indexes = indexS.toList();
  for (int i = 0; i <= 10; i++){
    var element = indexes[i];
    testQ.add(questions[element]);
    testA.add(answers[element]);
  }
  var newTest = Quiz(testQ, testA);
  return newTest;
}
class TestA extends StatefulWidget {
  @override
  _TestAState createState() => _TestAState();
  void initState () {

  }
}

class _TestAState extends State<TestA> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: Text(
          'Vocabulary Test',
          style: TextStyle(
            fontFamily: 'Oswald',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
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
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Text(
                "Question : What is the equivalent of '$wordA' ?",
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
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
            TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "(only lowercase, no extra spaces)",
              ),
              onSubmitted: (answer){
              },
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
              child: Center(
                child: Text(
                  "Answer Status: $answerMessage",
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Check Answer.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: (){
                  answerA = myController.text;
                  expectedAnswerA = currentTestA.answersList[counter];
                  isCorrect = (answerA == currentTestA.answersList[counter]);
                  answerMessage = (isCorrect == true ) ?  "Correct!" : "Sorry, that answer was incorrect.\n The expected answer to this question was $expectedAnswerA.";
                  if (isCorrect == true) {
                    setState(() {
                      noCorrect = noCorrect + 1;
                    });
                  }
                  Future.delayed(const Duration(milliseconds: 2500), () {
                    setState(() {
                      wordA = currentTestA.questionList[counter];
                      answerMessage = "Waiting for response....";
                    });
                  });
                  setState(() {
                    counter = counter + 1;
                  });
                  if (10 == counter) {
                    ScoreOperations.readScore().then((score) {
                      setState(() {
                        lastScore = int.parse(score);
                      });
                    });
                    Future.delayed(const Duration(milliseconds: 2300), () {
                      ScoreOperations.saveScore(noCorrect.toString());
                    });
                  }
                  if (counter == 10){
                    Future.delayed(const Duration(milliseconds: 2650), () {
                      setState(() {
                        NC = noCorrect;
                        displayNoCorrect = noCorrect.toString();
                        counter = 0;
                        noCorrect = 0;
                      });
                      setState(() {
                        currentTestA =  quizGenerator(questionsA, answersA);
                      });
                      Navigator.pushReplacementNamed(context, '/sa');
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
