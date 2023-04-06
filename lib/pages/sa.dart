import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/testA.dart';

num currentScoreA;
var displayPastScoreA;
var scoreChangeA;
var displayscoreChangeA = (NC - lastScore).toString();
var percentageScoreChangeA;
var percentageScoreIntA;
var displayProgressTextA;
var recommendationA;

class ScoreA extends StatefulWidget {
  @override
  _ScoreAState createState() => _ScoreAState();
}

class _ScoreAState extends State<ScoreA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          title: Text(
            'Test Results',
            style: TextStyle(
              fontFamily: 'Oswald',
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  'You got $displayNoCorrect/10.',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Would you like to take another test?',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0,0,10.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'View Progress',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        scoreChangeA = NC -lastScore;
                        displayscoreChangeA = scoreChangeA.toString();
                      });
                      if (scoreChangeA> 0) {
                        setState(() {
                          displayProgressTextA = "You've improved, keep it up!";
                        });
                      }
                      if (scoreChangeA < 0) {
                        setState(() {
                          displayProgressTextA = "Your score has decreased since your last test.";
                        });
                      }
                      if (scoreChangeA == 0) {
                        setState(() {
                          displayProgressTextA = "You're score hasn't changed.";
                        });
                      }
                      if (NC == lastScore) {
                        setState(() {
                          displayscoreChangeA = '0';
                        });
                      }
                      if (NC >= 0 && NC < 5) {
                        setState(() {
                          recommendationA = "Easy";
                        });
                      }
                      if (NC >= 5 && NC < 8) {
                        setState(() {
                          recommendationA = "Medium";
                        });
                      }
                      if (NC >= 8 && NC <= 10) {
                        setState(() {
                          recommendationA = "Hard";
                        });
                      }
                      print (displayProgressTextA);
                      Navigator.pushReplacementNamed(context, '/pa');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0,0,10.0),
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
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0,0,10.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 30.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      'Take Another Test',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/testA');
                    },
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}