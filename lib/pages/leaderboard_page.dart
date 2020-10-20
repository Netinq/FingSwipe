import 'package:fingSwipeV2/models/leaderboard_score.dart';
import 'package:fingSwipeV2/models/local_storage.dart';
import 'package:fingSwipeV2/models/score_api.dart';
import 'package:fingSwipeV2/models/scroll_configuration.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:fingSwipeV2/widgets/core_widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'all_scores.dart';

// ignore: must_be_immutable
class LeaderboardPage extends StatelessWidget {
  final scores = Score();
  final localStorage = LocalStorage();

  Future<Map<String, dynamic>> getLeaderboardData() async {
    final List<LeaderboardScore> scoresData = await scores.getAll();
    final int globalHighScore = scoresData[0].score;

    final int localHighScore = await localStorage.getHighScore();

    return <String, dynamic>{
      "scores": scoresData,
      "globalHighScore": globalHighScore,
      "localHighScore": localHighScore
    };
  }

  Padding divider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Divider(
        color: Color(0xFFF4E6F7),
        thickness: 2,
        indent: MediaQuery.of(context).size.width * 0.1,
        endIndent: MediaQuery.of(context).size.width * 0.1,
      ),
    );
  }

  TextStyle titleStyle = TextStyle(
    fontSize: 40,
    color: Color(0xFFEEEEEE),
    fontWeight: FontWeight.w700,
  );

  Container circle(context, int number) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: Color(0xFFEEEEEE),
        ),
      ),
      child: Center(
        child: AutoSizeText(
          number.toString(),
          style: TextStyle(
            color: Color(0xFFFEEEEEE),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<Map<String, dynamic>>(
          future: getLeaderboardData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Map<String, dynamic> data = snapshot.data;
              return SafeArea(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // world record
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            language.translateToFrench
                                ? "RECORD\nMONDIALE"
                                : "WORLD\nRECORD",
                            style: titleStyle,
                          ),
                          circle(context, data["globalHighScore"])
                        ],
                      ),
                    ),

                    divider(context),

                    // personal record
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            language.translateToFrench
                                ? "MON\nRECORD"
                                : "MY\nRECORD",
                            style: titleStyle,
                          ),
                          circle(context, data["localHighScore"])
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Divider(
                        color: Color(0xFFF4E6F7),
                        thickness: 2,
                        indent: MediaQuery.of(context).size.width * 0.1,
                        endIndent: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),

                    CommonButton(
                      text: Text(
                        language.translateToFrench
                            ? "TOUT LES SCORES"
                            : "ALL SCORES",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                          color: Color(0xffffffff),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/trophy.png",
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ScoresPage(
                              scores: data["scores"],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('menu', (route) => false);
        },
      ),
    );
  }
}
