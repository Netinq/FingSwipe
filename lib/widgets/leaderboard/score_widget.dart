import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;
  final int rank;
  final String name;

  const ScoreWidget({this.score, this.rank, this.name});

  static const TextStyle textStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600
  );

  LinearGradient generateColour() {
    switch (rank) {
      case (0):
        return LinearGradient(
          colors: [
            Color(0xffFEFEA4),
            Color(0xffF5CA42),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case (1):
        return LinearGradient(
          colors: [
            Color(0xffE1E1E1),
            Color(0xffB8B8B8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case (2):
        return LinearGradient(
          colors: [
            Color(0xffFFC9A9),
            Color(0xffF7AE76),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return LinearGradient(
          colors: [
            Color(0xffA9E5FF),
            Color(0xff76B2F7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Text(rank.toString(), style: TextStyle(fontSize: 25),),
      title: Text(name, style: TextStyle(fontSize: 30),),
      trailing: Text("$score", style: TextStyle(fontSize: 25),),
    );
  }
}
