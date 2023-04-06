import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/easytest.dart';

num currentScore;
var displayPastScore;
var scoreChange;
var displayscoreChange = (NC - lastScore).toString();
var percentageScoreChange;
var percentageScoreInt;
var displayProgressText;
var recommendation;

class ScoreE extends StatefulWidget {
  @override
  _ScoreEState createState() => _ScoreEState();
}

class _ScoreEState extends State<ScoreE> {
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
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
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
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
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
                padding: const EdgeInsets.fromLTRB(0.0,0,0,0),
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
                        scoreChange = NC -lastScore;
                        displayscoreChange = scoreChange.toString();
                      });
                      if (scoreChange > 0) {
                        setState(() {
                          displayProgressText = "You've improved, keep it up!";
                        });
                      }
                      if (scoreChange < 0) {
                        setState(() {
                          displayProgressText = "Your score has decreased since your last test.";
                        });
                      }
                      if (scoreChange == 0) {
                        setState(() {
                          displayProgressText = "You're score hasn't changed.";
                        });
                      }
                      if (NC == lastScore) {
                        setState(() {
                          displayscoreChange = '0';
                        });
                      }
                      if (NC >= 0 && NC < 5) {
                        setState(() {
                          recommendation = "Easy";
                        });
                      }
                      if (NC >= 5 && NC < 8) {
                        setState(() {
                          recommendation = "Easy";
                        });
                      }
                      if (NC >= 8 && NC <= 10) {
                        setState(() {
                          recommendation = "Medium";
                        });
                      }
                      print (displayProgressText);
                      Navigator.pushReplacementNamed(context, '/ep');
                    },
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
                      Navigator.pushReplacementNamed(context, '/et');
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