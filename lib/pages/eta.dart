
import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/score.dart';
import 'dart:math';
import 'package:french_learning_ia/services/F_O.dart';



var noCorrect = 0;
var counter = 0;
var NC;
var expectedAnswerEA;
List <String> answersEA = ['etre','avoir','pouvoir','faire','mettre','dire','devoir','prendre','donner','aller','vouloir','savoir','etre','falloir','lire','finir','manger','prendre','regarder', 'voir', 'venir', 'suivre', 'parler', 'croire', 'aimer', 'passer', 'penser', 'attendre', 'trouver', 'laisser', 'arriver', 'donner', 'appeler', 'partir', 'mettre', 'rester', 'arreter', 'connaitre', 'demander', 'comprendre', 'sortir', 'entendre', 'chercher', 'aider', 'essayer', 'revenir', 'jouer', 'finir', 'perdre', 'sentir',];
List <String> questionsEA = ['to be','to have','to be able to','to do','to put','to say','to have to','to take','to give','to go','to want','to know','to be','to have to','to read','to finish','to eat','to take','to look', 'to see', 'to come', 'to follow', 'to talk', 'to believe', 'to like', 'to pass', 'to think', 'to wait for', 'to find', 'to leave', 'to arrive', 'to give', 'to call', 'to go', 'to put', 'to stay', '	to stop', 'to know','to ask', 'to understand', 'to go out', 'to hear', 'to look for', 'to help', 'to try', 'to come back', 'to play', 'to finish', 'to lose', 'to smell',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 50;
var displayNoCorrect;
var lastScore;
var myController = TextEditingController();
Quiz currentTestEA =  quizGenerator(questionsEA,answersEA);
var answerEA;
var wordEA;
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
class EasyTestA extends StatefulWidget {
  @override
  _EasyTestAState createState() => _EasyTestAState();
  void initState () {

  }
}

class _EasyTestAState extends State<EasyTestA> {
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
                "Question : What is the equivalent of '$wordEA' ?",
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
                  answerEA = myController.text;
                  expectedAnswerEA = currentTestEA.answersList[counter];
                  isCorrect = (answerEA == currentTestEA.answersList[counter]);
                  answerMessage = (isCorrect == true ) ?  "Correct!" : "Sorry, that answer was incorrect.\n The expected answer to this question was $expectedAnswerEA.";
                  if (isCorrect == true) {
                    setState(() {
                      noCorrect = noCorrect + 1;
                    });
                  }
                  Future.delayed(const Duration(milliseconds: 2500), () {
                    setState(() {
                      wordEA = currentTestEA.questionList[counter];
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
                        currentTestEA =  quizGenerator(questionsEA, answersEA);
                      });
                      Navigator.pushReplacementNamed(context, '/esa');
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
