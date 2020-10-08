import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class GamePageV2 extends StatefulWidget {
  @override
  _GamePageV2State createState() => _GamePageV2State();
}

class _GamePageV2State extends State<GamePageV2>
    with SingleTickerProviderStateMixin {
  String currentIndication = "Arrow";

  String translateMode(String swipeMode, bool needTranslate) {
    if (needTranslate) {
      if (swipeMode == 'Arrows !') {
        return 'Flèches !';
      } else if (swipeMode == 'Text !') {
        return 'Texte !';
      }
    }

    return swipeMode;
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final language = Provider.of<LanguageProvider>(context);

    if (!game.run && game.engine) {
      game.resetEngine();
      Future.microtask(
        () => Navigator.of(context)
            .pushNamedAndRemoveUntil('normalEnd', (route) => false),
      );
    } else if (!game.run && !game.engine) {
      game.initialize();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SimpleGestureDetector(
        swipeConfig: SimpleSwipeConfig(
          horizontalThreshold: 0,
          verticalThreshold: 0,
          swipeDetectionBehavior: SwipeDetectionBehavior.singular,
        ),
        onHorizontalSwipe: (SwipeDirection direction) {
          if (direction == SwipeDirection.right) {
            game.check(1);
          }
          if (direction == SwipeDirection.left) {
            game.check(3);
          }
        },
        onVerticalSwipe: (SwipeDirection direction) {
          if (direction == SwipeDirection.up) {
            game.check(0);
          }
          if (direction == SwipeDirection.down) {
            game.check(2);
          }
        },
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Follow the\n",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: currentIndication,
                      style:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.w900))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
