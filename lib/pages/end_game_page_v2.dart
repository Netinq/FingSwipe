import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/local_cache_provider.dart';
import '../providers/game_provider.dart';
import '../providers/language_provider.dart';

class NormalEndV2 extends StatelessWidget {
  final LocalStorage localStorage = LocalStorage();
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    final game = Provider.of<Game>(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      language.translateToFrench ? "MON\nRECORD" : "MY\nRECORD",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color(0xFFEEEEEE),
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.15,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 5,
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                      child: Center(
                        child: FutureBuilder<int>(
                            future: localStorage.getHighScore(),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                  color: Color(0xFFFEEEEEE),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Color(0xFFF4E6F7),
                thickness: 2,
                indent: MediaQuery.of(context).size.width * 0.15,
                endIndent: MediaQuery.of(context).size.width * 0.15,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 5,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
                child: Center(
                  child: Text(
                    game.score.toString(),
                    style: TextStyle(
                      color: Color(0xFFFEEEEEE),
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                elevation: 3,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('menu', (route) => false);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFBC6FC2),
                        Color(0xFF8E95F1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          language.translateToFrench ? "REJOUER" : "PLAY AGAIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Image.asset('assets/play.png', height: 25,),
                      ],
                    ),
                  ),
                ),
              ),
              RaisedButton(
                elevation: 3,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFBC6FC2),
                        Color(0xFF8E95F1),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          language.translateToFrench ? "AJOUTER AU CLASSEMENT" : "ADD TO LEADERBOARD",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Image.asset('assets/trophy.png', height: 25,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
