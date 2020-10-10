import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';
import '../../providers/language_provider.dart';

class Indications extends StatefulWidget {
  @override
  _IndicationsState createState() => _IndicationsState();
}

class _IndicationsState extends State<Indications>
    with SingleTickerProviderStateMixin {
  bool run = true;

  String translateText(String currentText, bool needTranslate) {
    if (needTranslate) {
      if (currentText == "Top") {
        return "Haut";
      } else if (currentText == "Right") {
        return "Droite";
      } else if (currentText == "Bottom") {
        return "Bas";
      } else if (currentText == "Left") {
        return "Gauche";
      }
    }

    return currentText;
  }

  AnimationController timerAnimationController;
  double target = 0;

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
    final language = Provider.of<LanguageProvider>(context);
    final game = Provider.of<Game>(context);

    if (game.score_old != game.score) {
      timerAnimationController.reset();
      game.score_old = game.score;
    }

    if (!this.run) {
      timerAnimationController.dispose();
    } else {
      timerAnimationController..forward();
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 2,
            color: Color(0xffEEEEEE),
          ),
          color: Color(0xffbfa8ec),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                animation: timerAnimationController,
                builder: (BuildContext context, Widget child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3), //fucks up cause it doesn't start at 50
                      color: Color(0xffB7A5D9), //was previously Color(0xffcdbaf2)
                    ),
                    width: timerAnimationController.value,
                    height: 300,
                  );
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: game.getArrowDirection() - (pi / 2),
                    child: SvgPicture.asset(
                      'assets/arrow.svg',
                      fit: BoxFit.scaleDown,
                      height: 100,
                      color: game.getArrowColor(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    translateText(
                        game.getWordDirection(), language.translateToFrench),
                    style: TextStyle(fontSize: 55, color: game.getWordColor(), fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


