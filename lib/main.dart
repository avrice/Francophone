import 'package:flutter/material.dart';
import 'package:french_learning_ia/pages/battlemode.dart';
import 'package:french_learning_ia/pages/bmeasy.dart';
import 'package:french_learning_ia/pages/bmhard.dart';
import 'package:french_learning_ia/pages/bmmedium.dart';
import 'package:french_learning_ia/pages/easytest.dart';
import 'package:french_learning_ia/pages/esa.dart';
import 'package:french_learning_ia/pages/eta.dart';
import 'package:french_learning_ia/pages/hardtest.dart';
import 'package:french_learning_ia/pages/home.dart';
import 'package:french_learning_ia/pages/hpa.dart';
import 'package:french_learning_ia/pages/hsa.dart';
import 'package:french_learning_ia/pages/hta.dart';
import 'package:french_learning_ia/pages/pa.dart';
import 'package:french_learning_ia/pages/pea.dart';
import 'package:french_learning_ia/pages/progress.dart';
import 'package:french_learning_ia/pages/sa.dart';
import 'package:french_learning_ia/pages/scoreE.dart';
import 'package:french_learning_ia/pages/scoreH.dart';
import 'package:french_learning_ia/pages/test.dart';
import 'package:french_learning_ia/pages/score.dart';
import 'package:french_learning_ia/pages/progressE.dart';
import 'package:french_learning_ia/pages/progressH.dart';
import 'package:french_learning_ia/pages/testA.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/test': (context) => Test(),
      '/testA': (context) => TestA(),
      '/score': (context) => Score(),
      '/progress': (context) => Progress(),
      '/ht': (context) => HardTest(),
      '/hta': (context) => HardTestA(),
      '/et': (context) => EasyTest(),
      '/eta': (context) => EasyTestA(),
      '/es': (context) => ScoreE(),
      '/hs': (context) => ScoreH(),
      '/ep': (context) => ProgressE(),
      '/hp': (context) => ProgressH(),
      '/esa': (context) => ScoreEA(),
      '/epa': (context) => ProgressEA(),
      '/hpa': (context) => ProgressHA(),
      '/ta': (context) => TestA(),
      '/hsa': (context) => ScoreHA(),
      '/sa': (context) => ScoreA(),
      '/pa': (context) => ProgressA(),
      '/bm': (context) => BattleMode(),
      '/bme': (context) => EasyBM(),
      '/bmm': (context) => MediumBM(),
      '/bmh': (context) => HardBM(),
    }
));
