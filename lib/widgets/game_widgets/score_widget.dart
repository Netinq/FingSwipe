import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ScoreWidget extends StatefulWidget {
  @override
  _ScoreWidgetState createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);

    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3, color: Color(0xffEEEEEE),),
        ),
        child: Center(
          child: Text(game.score.toString(),
            style: TextStyle(fontSize: 40, color: Color(0xffEEEEEE),),
          ),
        ),
      ),
    );
  }
}
