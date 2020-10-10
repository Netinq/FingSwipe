import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Game with ChangeNotifier {

  final Random _random = Random();

  bool run = false;
  bool engine = false;
  int score = 0;
  int score_old = -1;

  Timer timer = null;

  List swipeModes = ["Arrows !", "Text !"];
  List<double> arrowDirections = [
    0.toDouble(),
    (pi / 2).toDouble(),
    (pi).toDouble(),
    ((3 * pi) / 2).toDouble(),
  ];

  List<String> wordDirections = [
    "Top",
    "Right",
    "Bottom",
    "Left",
  ];

  int progress_value = 0;
  int swipe_mode = 0;
  int direction = 0;
  int direction_arrow = 0;
  int direction_word = 0;
  int direction_previous = 0;

  static const Color green = Color(0xff33FF6E); // was previously Color(0xff62C980)
  static const Color white = Color(0xffEEEEEE);

  Color color_arrow = white;
  Color color_word = white;
  
  Duration time = Duration(milliseconds: 2000);

  void initialize()
  {
    this.score = 0;
    this.run = true;
    this.engine = true;
    this.runGame();
  }

  void runGame()
  {
      this.direction = randomDirection(false);
      this.swipe_mode = randomSwipe();

      switch (this.swipe_mode) {
        case 0:
          this.direction_arrow = this.direction;
          this.direction_word = randomDirection(true);
          break;
        case 1:
          this.direction_arrow = randomDirection(true);
          this.direction_word = this.direction;
          break;
      }

      switch (randomColor()) {
        case 0:
          this.color_arrow = green;
          this.color_word = white;
          break;
        case 1:
          this.color_arrow = white;
          this.color_word = green;
          break;
      }

      this.delay();
  }

  void restartGame()
  {
      this.direction = randomDirection(false);
      this.swipe_mode = randomSwipe();

      switch (this.swipe_mode) {
        case 0:
          this.direction_arrow = this.direction;
          this.direction_word = randomDirection(true);
          break;
        case 1:
          this.direction_arrow = randomDirection(true);
          this.direction_word = this.direction;
          break;
      }

      switch (randomColor()) {
        case 0:
          this.color_arrow = green;
          this.color_word = white;
          break;
        case 1:
          this.color_arrow = white;
          this.color_word = green;
          break;
      }

      notifyListeners();
      this.delay();
  }

  int randomDirection(bool allowPrevious)
  {
    List directions = [0, 1, 2, 3];
    if (!allowPrevious) directions.remove(direction_previous);

    return directions[_random.nextInt(3)];
  }

  int randomSwipe()
  {
    return _random.nextInt(2);
  }

  int randomColor()
  {
    return _random.nextInt(2);
  }

  void check(int swipe_direction)
  {
    if (swipe_direction == this.direction)
    {
      this.direction_previous = this.direction;
      this.score++;
      this.timer.cancel();
      this.restartGame();
    } 
    else
    {
      this.stopGame();
    }
  }

  void stopGame()
  {
      this.run = false;
      this.timer.cancel();
      notifyListeners();
  }

  void resetEngine()
  {
    this.engine = false;
  }

  void delay()
  {
    this.timer = Timer(this.time, () {
      this.stopGame();
    });
  }

  String getSwipeMode() { return this.swipeModes[this.swipe_mode]; }

  double getArrowDirection() { return this.arrowDirections[this.direction_arrow]; }
  String getWordDirection() { return this.wordDirections[this.direction_word]; }

  Color getArrowColor() { return this.color_arrow; }
  Color getWordColor() { return this.color_word; }
}