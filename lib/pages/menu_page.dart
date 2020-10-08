import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);

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
              // onTap: () {
              //   Navigator.pushNamed(context, 'normalGame');
              // },
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
                  bottom: 250,
                  left: 15,
                  child: Column(
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('normalGame');
                        },
                        child: Container(
                          height: 75,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(150)),
                              image: DecorationImage(
                                image: AssetImage('assets/btn1.png'),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 35, right: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  language.translateToFrench
                                      ? "Normale"
                                      : "Normal",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color(0xffffffff)),
                                ),
                                Image.asset("assets/play.png",
                                    height: 35, fit: BoxFit.cover),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('leaderboard');
                        },
                        child: Container(
                          height: 75,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(150)),
                              image: DecorationImage(
                                image: AssetImage('assets/btn2.png'),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 35, right: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  language.translateToFrench
                                      ? "Défis"
                                      : "Challenge",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color(0xffffffff)),
                                ),
                                Image.asset("assets/play.png",
                                    height: 35, fit: BoxFit.cover),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 125,
                  left: 15,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('leaderboard');
                    },
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(150)),
                          image: DecorationImage(
                            image: AssetImage('assets/btn3.png'),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(left: 35, right: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              language.translateToFrench
                                  ? "Classement"
                                  : "Leaderboard",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                  color: Color(0xffffffff)),
                            ),
                            Image.asset("assets/trophy.png",
                                height: 25, fit: BoxFit.cover),
                          ],
                        ),
                      ),
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
                        FlatButton(
                          onPressed: () {
                            // @TODO
                          },
                          child: Image.asset(
                            'assets/settings.png',
                            height: 30,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            // @TODO
                          },
                          child: Image.asset(
                            'assets/about.png',
                            height: 30,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            // @TODO
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
              ]),
        ),
      ],
    );
  }
}
