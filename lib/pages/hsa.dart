import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/hta.dart';

num currentScore;
var displayPastScore;
var scoreChange;
var displayscoreChange = (NC - lastScore).toString();
var percentageScoreChange;
var percentageScoreInt;
var displayProgressText;
var recommendation;

class ScoreHA extends StatefulWidget {
  @override
  _ScoreHAState createState() => _ScoreHAState();
}

class _ScoreHAState extends State<ScoreHA> {
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
              ButtonTheme(
                minWidth: 200.0,
                height: 30.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0,0,0,10.0),
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
                          recommendation = "Medium";
                        });
                      }
                      if (NC >= 5 && NC < 8) {
                        setState(() {
                          recommendation = "Hard";
                        });
                      }
                      if (NC >= 8 && NC <= 10) {
                        setState(() {
                          recommendation = "Hard";
                        });
                      }
                      print (displayProgressText);
                      Navigator.pushReplacementNamed(context, '/hpa');
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
                      Navigator.pushReplacementNamed(context, '/hta');
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