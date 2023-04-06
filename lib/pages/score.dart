import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/test.dart';

num currentScore;
var displayPastScore;
var scoreChange;
var displayscoreChange = (NC - lastScoreM).toString();
var percentageScoreChange;
var percentageScoreInt;
var displayProgressText;
var recommendation;

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
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
                          scoreChange = NC -lastScoreM;
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
                        if (NC == lastScoreM) {
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
                            recommendation = "Medium";
                          });
                        }
                        if (NC >= 8 && NC <= 10) {
                          setState(() {
                            recommendation = "Hard";
                          });
                        }
                        print (displayProgressText);
                        Navigator.pushReplacementNamed(context, '/progress');
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
                  padding: const EdgeInsets.fromLTRB(0.0,10,0,10.0),
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
                        Navigator.pushReplacementNamed(context, '/test');
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