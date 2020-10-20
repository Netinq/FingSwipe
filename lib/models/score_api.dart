import 'dart:convert';

import 'package:http/http.dart' as http;

import 'leaderboard_score.dart';

class Score {
  void store(String username, int score) async {
    
    Map body = Map.from({
      'username': username,
      'score': score.toString(),
    });

    var result = await http.post(
      "https://fingswipe.app/api/score",
      body: body,
    );

    print(result.statusCode);
  }

  Future<List<LeaderboardScore>> getAll() async {
    http.Response result = await http.get(
      "https://fingswipe.app/api/score/getAll",
    );

    switch (result.statusCode) {
      case 200:
        Map body = Map.from(jsonDecode(result.body));
        List results = body["scores"];

        List<LeaderboardScore> convertedResults = [];

        for (Map result in results) {
          convertedResults.add(
            LeaderboardScore(
              name: result['username'],
              score: result['score'],
            ),
          );
        }

        return convertedResults;
    }
  }
}
