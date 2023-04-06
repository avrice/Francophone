import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/hsa.dart';

class ProgressHA extends StatefulWidget {
  @override
  _ProgressHAState createState() => _ProgressHAState();
}

class _ProgressHAState extends State<ProgressHA> {
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
                  'Change of marks since last test: $displayscoreChange',
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
                  'Difficulty Level Recommendation: $recommendation',
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
                  '$displayProgressText',
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
