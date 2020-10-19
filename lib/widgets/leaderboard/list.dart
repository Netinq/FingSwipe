import 'package:flutter/material.dart';

import 'score_widget.dart';

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
