// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Game with ChangeNotifier {
//   final Random random = Random();

//   bool isAlive = true;
//   bool finished = false;
//   bool win = false;

//   int score = 1;
//   int previousScore = 0;

//   List swipeModes = ["Arrows!", "Text!"];

//   List<double> arrowDirections = [
//     0.toDouble(),
//     (pi / 2).toDouble(),
//     (pi).toDouble(),
//     ((3 * pi) / 2).toDouble(),
//   ];

//   List<String> wordDirections = [
//     "Top",
//     "Right",
//     "Bottom",
//     "Left",
//   ];

//   int absoluteDirection = 0; //direction given with an index for the list
//   int previousAbsoluteDirection = 0;

//   int absoluteWrongDirection = 0;
//   int previousWrongDirection = 0;

//   String currentSwipeMode = "Arrows!";
//   String currentWordDirection = "Right";
//   num currentArrowDirection = pi / 2;

//   Color arrowColor = Color(0xff62C980);
//   Color wordColor = Colors.black;

//   Duration timeGivenToSwipe = Duration(seconds: 2);

//   void runGame() async {

//     isAlive = true;
//     finished = false;

//     score = 1;
//     previousScore = 0;

//     while (isAlive) {

//       win = false;
//       changeDirectionV1();
      
//       changeColor();

//       if (score % 5 == 0 && score > 1) {
//         changeSwipeMode();
//       }

//       if (score == previousScore) {
//         isAlive = false;
//       }

//       notifyListeners();
//       await Future.delayed(timeGivenToSwipe);
//     }
//   }

//   void changeSwipeMode() {
//     currentSwipeMode == swipeModes[0]
//         ? currentSwipeMode = swipeModes[1]
//         : currentSwipeMode = swipeModes[0];
//   }

//   void changeDirectionV1() {
//     List availableIndices = [0, 1, 2, 3];

//     availableIndices.remove(previousAbsoluteDirection);
//     absoluteDirection = availableIndices[random.nextInt(3)];

//     if (currentSwipeMode == swipeModes[0]) {
//       //arrows
//       currentArrowDirection = arrowDirections[absoluteDirection];

//       currentWordDirection = wordDirections[random.nextInt(4)];
//     } else if (currentSwipeMode == swipeModes[1]) {
//       //text
//       currentWordDirection = wordDirections[absoluteDirection];

//       currentArrowDirection = arrowDirections[random.nextInt(4)];
//     }
//   }

//   void changeDirectionV2() {
//     List allAbsDirs = [0, 1, 2, 3];
//     allAbsDirs.remove(previousAbsoluteDirection);
//     absoluteDirection = allAbsDirs[random.nextInt(3)];

//     List allWrongDirs = [0, 1, 2, 3];
//     allWrongDirs.remove(previousWrongDirection); // 1
//     allWrongDirs.remove(absoluteDirection); // 0

//     absoluteWrongDirection = allWrongDirs[random.nextInt(2)];

//     if (swipeModes == swipeModes[0]) {
//       // in arrow mode, change arrow to correct dir and word to a wrong dir
//       currentArrowDirection = arrowDirections[absoluteDirection];
//       currentWordDirection = wordDirections[absoluteWrongDirection];
//     } else if (swipeModes == swipeModes[1]) {
//       // in word mode, change word to correct dir and arrow to a wrong dir
//       currentWordDirection = wordDirections[absoluteDirection];
//       currentArrowDirection = arrowDirections[absoluteWrongDirection];
//     }

//     previousAbsoluteDirection = absoluteDirection;
//     previousWrongDirection = absoluteWrongDirection;
//         }

//   void check(int direction) {
//     print("$direction == $absoluteDirection");
//     if (direction == absoluteDirection) {
//       previousScore = score;
//       score++;
//       win = true;
//       notifyListeners();
//     } else {
//       this.end();
//     }
//   }

//   void changeColor() {
//     bool ran = random.nextBool();
//     if (ran) {
//       arrowColor = Color(0xff62C980);
//       wordColor = Colors.black;
//     } else {
//       wordColor = Color(0xff62C980);
//       arrowColor = Colors.black;
//     }
//   }

//   int getScore() { return score; }

//   void end()
//   {
//     finished = true;
//     isAlive = false;
//     notifyListeners();
//   }

//   String getSwipeMode()
//   {
//     return this.swipeModes[this.swipe_mode];
//   }
// }
