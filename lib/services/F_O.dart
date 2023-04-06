import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ScoreOperations {
  static Future<String> get getScorePath async {
    final scorePath = await getApplicationDocumentsDirectory();
    return scorePath.path;
  }

  static Future<File> get getScore async {
    final scoreP = await getScorePath;
    return File('$scoreP/lastScore.txt');
  }

  static Future<File> saveScore(String data) async {
    final scoreFile = await getScore;
    return scoreFile.writeAsString(data);
  }

  static Future<String> readScore() async {
    try {
      final scoreFile = await getScore;
      String pastScore = await scoreFile.readAsString();
      return pastScore;
    } catch (e) {
      return "";
    }
  }
}