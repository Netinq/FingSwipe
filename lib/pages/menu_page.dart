import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../widgets/core_widgets/common_buttons.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    
    language.getStoredLanguage();

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height / 16,
                left: 50,
                child: Image.asset(
                  "assets/title.png",
                  width: MediaQuery.of(context).size.width - 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 230,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonButton(
                            onTap: () {
                              Navigator.of(context).pushNamed('normalGame');
                            },
                            text: Text(
                              language.translateToFrench ? "JOUER" : "PLAY",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                                color: Color(0xffffffff),
                              ),
                            ),
                            icon: Image.asset(
                              "assets/play.png",
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 50),
                          // CommonButton(
                          //   onTap: () {
                          //     Navigator.of(context).pushNamed('leaderboard');
                          //   },
                          //   text: Text(
                          //     language.translateToFrench ? "Défis" : "Challenge",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.w400,
                          //       fontSize: 25,
                          //       color: Color(0xffffffff),
                          //     ),
                          //   ),
                          //   icon: Image.asset(
                          //     "assets/play.png",
                          //     height: 35,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          CommonButton(
                            icon: Image.asset(
                              "assets/trophy.png",
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('leaderboard');
                            },
                            text: Text(
                              language.translateToFrench
                                  ? "CLASSEMENT"
                                  : "LEADERBOARD",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 25,
                bottom: 25,
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(150))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // @TODO
                          Fluttertoast.showToast(msg: "Coming soon!");
                        },
                        child: Image.asset(
                          'assets/settings.png',
                          height: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // @TODO
                          Fluttertoast.showToast(msg: "Coming soon!");
                        },
                        child: Image.asset(
                          'assets/about.png',
                          height: 30,
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () {
                          Fluttertoast.showToast(
                            msg: language.translateToFrench
                                ? "Change la langue"
                                : "Change the language",
                          );
                        },
                        onTap: () {
                          language.translateToFrench
                              ? language.toEnglish()
                              : language.toFrench();
                        },
                        child: Image.asset(
                          'assets/lang.png',
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
