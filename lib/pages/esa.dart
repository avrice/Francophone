import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/eta.dart';

num currentScoreEA;
var displayPastScoreEA;
var scoreChangeEA;
var displayscoreChangeEA = (NC - lastScore).toString();
var percentageScoreChangeEA;
var percentageScoreIntEA;
var displayProgressTextEA;
var recommendationEA;

class ScoreEA extends StatefulWidget {
  @override
  _ScoreEAState createState() => _ScoreEAState();
}

class _ScoreEAState extends State<ScoreEA> {
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
                padding: const EdgeInsets.fromLTRB(0.0,10,0,10.0),
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
                        scoreChangeEA = NC -lastScore;
                        displayscoreChangeEA = scoreChangeEA.toString();
                      });
                      if (scoreChangeEA > 0) {
                        setState(() {
                          displayProgressTextEA = "You've improved, keep it up!";
                        });
                      }
                      if (scoreChangeEA < 0) {
                        setState(() {
                          displayProgressTextEA = "Your score has decreased since your last test.";
                        });
                      }
                      if (scoreChangeEA == 0) {
                        setState(() {
                          displayProgressTextEA = "You're score hasn't changed.";
                        });
                      }
                      if (NC == lastScore) {
                        setState(() {
                          displayscoreChangeEA = '0';
                        });
                      }
                      if (NC >= 0 && NC < 5) {
                        setState(() {
                          recommendationEA = "Easy";
                        });
                      }
                      if (NC >= 5 && NC < 8) {
                        setState(() {
                          recommendationEA = "Easy";
                        });
                      }
                      if (NC >= 8 && NC <= 10) {
                        setState(() {
                          recommendationEA = "Medium";
                        });
                      }
                      print (displayProgressTextEA);
                      Navigator.pushReplacementNamed(context, '/epa');
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
                      Navigator.pushReplacementNamed(context, '/eta');
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