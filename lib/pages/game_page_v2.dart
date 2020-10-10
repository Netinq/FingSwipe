import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:fingSwipeV2/widgets/game_widgets/indications.dart';
import 'package:fingSwipeV2/widgets/game_widgets/score_widget.dart';
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

  AnimationController timerAnimationController;
  double target = 0;

  bool run = true;

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
  void initState() {
    timerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 300,
      value: target,
    )..stop();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timerAnimationController.dispose();
  }

  @override
  void deactivate() {
    this.run = false;
    super.deactivate();
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                      text: game.getSwipeMode(),
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.w900))
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Indications(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            ScoreWidget()

          ],
        ),
      ),
    );
  }
}
