import 'package:flutter/material.dart';

import '../../models/local_cache_provider.dart';

class DisplayedScore extends StatelessWidget {

  final int score;
  final String scoreType;
  final Color color;

  const DisplayedScore({Key key, this.score, this.scoreType, this.color}) : super(key: key);

  static final LocalScore localScore = LocalScore();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: this.color, width: 2.0),
        color: Color(0xffEEEEEE)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            scoreType,
            style: TextStyle(fontSize: 33, color: this.color),
          ),
          Text(
            score.toString(),
            style: TextStyle(fontSize: 50, color: this.color),
          ),
        ],
      ),
    );
  }
}
