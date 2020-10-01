import 'package:fingSwipeV2/models/leaderboard_score.dart';
import 'package:fingSwipeV2/widgets/leaderboard/score_widget.dart';
import 'package:flutter/material.dart';

class LeaderboardList extends StatelessWidget {
  final List<ScoreWidget> scores;

  LeaderboardList({Key key, this.scores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 5,
        );
      },
      itemCount: scores.length,
      itemBuilder: (BuildContext context, int index) {
        return scores[index];
      },
    );
  }
}
