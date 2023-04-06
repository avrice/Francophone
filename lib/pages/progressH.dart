import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/scoreH.dart';

class ProgressH extends StatefulWidget {
  @override
  _ProgressHState createState() => _ProgressHState();
}

class _ProgressHState extends State<ProgressH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: Text(
          'Progress Screen',
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Change of marks since last test: $displayscoreChangeH',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '$displayProgressTextH',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Difficulty Level Recommendation: $recommendationH',
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
              'Return to Home.',
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          )
        ],
        ),
      ),
    );
  }
}
