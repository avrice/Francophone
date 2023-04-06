
import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/scoreH.dart';
import 'dart:math';
import 'package:french_learning_ia/services/F_O.dart';



var noCorrect = 0;
var counter = 0;
var NC;
var expectedAnswerH;
List <String> questionsH = ['adorer','recevoir','utiliser','coucher','preferer','offrir','preparer','choisir','conduire','chanter','presenter','accepter','refuser', 'terminer','amuser','intéresser','rire','pardonner','embrasser','danser','detester','maintenir','supposer','epouser','approcher','craindre','crier','inviter','arranger','remercier','repeter','signer','accompagner','oser','permettre','annuler','laver','se plaindre','epeler','traduire','eteindre','allumer','se réveiller','ajouter','gouter','couter','cuire','décrire', 'effacer', 'enseigner',];
List <String> answersH = ['to adore','to receive','to use','to put to bed','to prefer','to offer','to prepare','to choose','to drive','to sing','to introduce','to accept','to refuse', 'to finish','to amuse','to interest','to laugh','to forgive','to kiss','to dance','to hate','to keep','to suppose','to marry','to approach','to fear','to shout','to invite','to arrange','to thank','to repeat','to sign','to go with','to dare','to allow','to cancel','to clean','to complain','to spell', 'to translate', 'to turn off','to turn on','to wake up','to add', 'to taste', 'to cost', 'to cook','to describe', 'to erase', 'to teach',];
var isCorrect = false;
var answerMessage = "Waiting for response....";
var noQuestions = 50;
var displayNoCorrect;
var lastScore;
var myController = TextEditingController();
Quiz currentTestH =  quizGenerator(questionsH,answersH);
var answerH;
var wordH;
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
class HardTest extends StatefulWidget {
  @override
  _HardTestState createState() => _HardTestState();
  void initState () {

  }
}

class _HardTestState extends State<HardTest> {
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
                "Question : What is the equivalent of '$wordH' ?",
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
                  answerH = myController.text;
                  expectedAnswerH = currentTestH.answersList[counter];
                  isCorrect = (answerH == currentTestH.answersList[counter]);
                  answerMessage = (isCorrect == true ) ?  "Correct!" : "Sorry, that answer was incorrect.\n The expected answer to this question was $expectedAnswerH.";
                  if (isCorrect == true) {
                    setState(() {
                      noCorrect = noCorrect + 1;
                    });
                  }
                  Future.delayed(const Duration(milliseconds: 2500), () {
                    setState(() {
                      wordH = currentTestH.questionList[counter];
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
                        currentTestH =  quizGenerator(questionsH, answersH);
                      });
                      Navigator.pushReplacementNamed(context, '/hs');
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
