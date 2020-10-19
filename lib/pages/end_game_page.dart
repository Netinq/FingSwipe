import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/local_cache_provider.dart';
import '../models/score_provider.dart';
import '../providers/game_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/core_widgets/appbar.dart';
import '../widgets/end_game/eng_game_buttons.dart';
import '../widgets/end_game/score.dart';

class NormalEnd extends StatefulWidget {
  @override
  _NormalEndState createState() => _NormalEndState();
}

class _NormalEndState extends State<NormalEnd> {
  LocalStorage localStorage = LocalStorage();
  Score score = Score();

  @override
  void initState() {
    super.initState();
  }

  bool stored = false;

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<Game>(context);
    final language = Provider.of<LanguageProvider>(context);

    if (stored == false) {
      localStorage.storeToCache(game.score);
      setState(() {
        stored = true;
      });
    }

    return Stack(children: <Widget>[
      Image.asset(
        "assets/background.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
      appBar: CustomAppBar(),
      body: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              FutureBuilder<int>(
                future: localStorage.getHighScore(),
                builder: (context, snapshot) {
                  return DisplayedScore(
                    scoreType: language.translateToFrench
                        ? 'MEILLEURS SCORE'
                        : 'BEST SCORE',
                    score: snapshot.data,
                    color: Color(0xff6ec2bb),
                  );
                }
              ),

              DisplayedScore(
                scoreType: 'SCORE',
                score: game.score,
                color: Color(0xff000000),
              ),

              Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 25.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Color(0xFFEEEEEE),
                  textColor: Color(0xFF0E0E0E),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.only(
                      bottom: 15.0, top: 15.0, left: 25.0, right: 25.0),
                  splashColor: Color(0xFFEDEDED),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController nameController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text(
                              language.translateToFrench ? 'Entrez votre pseudo:' :
                              "Enter name:",),
                          content: TextField(
                            controller: nameController,
                            autocorrect: true,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Name",
                            ),
                            onSubmitted: (String newName) {
                              score.store(nameController.text, game.score);
                              Navigator.pop(context);
                            },
                          ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  score.store(nameController.text, game.score);
                                  Navigator.pop(context);
                                },
                                child: Text(language.translateToFrench ? 'Partager' : 'Submit'),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      language.translateToFrench
                          ? "AJOUTER AU CLASSEMENT"
                          : "ADD ON LEADERBOARD",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                EndGameButtons(
                  text: language.translateToFrench ? 'REJOUER' : 'PLAY AGAIN',
                  route: 'normalGame',
                  mode: 1,
                ),
                EndGameButtons(
                  text: language.translateToFrench
                      ? 'MENU PRINCIPAL'
                      : 'MAIN MENU',
                  route: 'menu',
                  mode: 2,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    ],
    );
  }
}
