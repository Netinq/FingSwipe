import 'dart:async';
import 'dart:math';

import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';

class Indications extends StatefulWidget {
  @override
  _IndicationsState createState() => _IndicationsState();
}

class _IndicationsState extends State<Indications> {
  int progress_value = 200;

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

  @override
  void initState() {
    print(new DateTime.now());
    Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
      if (!this.run)
        timer.cancel();
      else
        setState(() {
          if (this.progress_value >= 2000)
            this.progress_value = 200;
          else
            this.progress_value += 200;
        });
    });
    super.initState();
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
      this.progress_value = 0;
      game.score_old = game.score;
    }

    double _anw = 0.0;
    double _anh = 0.0;

    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FAProgressBar(
              maxValue: 2000,
              size: 300,
              direction: Axis.horizontal,
              verticalDirection: VerticalDirection.up,
              currentValue: progress_value,
              // progressColor: Color(0xFF000000),
              progressColor: Color(0xFFEEEEEE),
              borderRadius: 0,
              animatedDuration: Duration(milliseconds: 0),
              // displayText: '%',
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: _anw,
                  height: _anh,
                  decoration: BoxDecoration(
                    color: Color(0xFF20E692),
                  ),
                  duration: Duration(milliseconds: 1),
                  curve: Curves.fastOutSlowIn,
                ),
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
                  translateText(game.getWordDirection(), language.translateToFrench),
                  style: TextStyle(fontSize: 35, color: game.getWordColor()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
