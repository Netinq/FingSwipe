import 'package:fingSwipeV2/models/leaderboard_score.dart';
import 'package:fingSwipeV2/models/local_storage.dart';
import 'package:fingSwipeV2/models/score_api.dart';
import 'package:fingSwipeV2/models/scroll_configuration.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LeaderboardPageV2 extends StatelessWidget {
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
                                : "WORLD RECORD",
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

                    divider(context),
                    // all records
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ScrollConfiguration(
                          behavior: NoScrollGlowBehaviour(),
                          child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 30);
                            },
                            itemCount: data["scores"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xffEEEEEE),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: AutoSizeText(
                                          data["scores"][index].score.toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffEEEEEE),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data["scores"][index].name,
                                    style: titleStyle,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    )
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
          Navigator.of(context).pushNamedAndRemoveUntil('menu', (route) => false);
        },
      ),
    );
  }
}
