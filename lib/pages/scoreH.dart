import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/hardtest.dart';

num currentScoreH;
var displayPastScoreH;
var scoreChangeH;
var displayscoreChangeH = (NC - lastScore).toString();
var percentageScoreChangeH;
var percentageScoreIntH;
var displayProgressTextH;
var recommendationH;

class ScoreH extends StatefulWidget {
  @override
  _ScoreHState createState() => _ScoreHState();
}

class _ScoreHState extends State<ScoreH> {
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
                        scoreChangeH = NC -lastScore;
                        displayscoreChangeH = scoreChangeH.toString();
                      });
                      if (scoreChangeH > 0) {
                        setState(() {
                          displayProgressTextH = "You've improved, keep it up!";
                        });
                      }
                      if (scoreChangeH < 0) {
                        setState(() {
                          displayProgressTextH = "Your score has decreased since your last test.";
                        });
                      }
                      if (scoreChangeH == 0) {
                        setState(() {
                          displayProgressTextH = "You're score hasn't changed.";
                        });
                      }
                      if (NC == lastScore) {
                        setState(() {
                          displayscoreChangeH = '0';
                        });
                      }
                      if (NC >= 0 && NC < 5) {
                        setState(() {
                          recommendationH = "Medium";
                        });
                      }
                      if (NC >= 5 && NC < 8) {
                        setState(() {
                          recommendationH = "Hard";
                        });
                      }
                      if (NC >= 8 && NC <= 10) {
                        setState(() {
                          recommendationH = "Hard";
                        });
                      }
                      print (displayProgressTextH);
                      Navigator.pushReplacementNamed(context, '/hp');
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
                      Navigator.pushReplacementNamed(context, '/ht');
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