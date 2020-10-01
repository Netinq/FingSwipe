import 'package:fingSwipeV2/main.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/leaderboard_score.dart';
import '../models/score_provider.dart';
import '../widgets/core_widgets/appbar.dart';
import '../widgets/leaderboard/score_widget.dart';

class LeaderboardPage extends StatelessWidget {
  final Score score = Score();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: Transform.translate(
        offset: Offset(-5, -5),
        child: Transform.scale(
          scale: 1.1,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'menu', (route) => false);
            },
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'MENU',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            // icon: Icon(LineIcons.long_arrow_left , color: Colors.black,),
            backgroundColor: Color(0xff6DC3BC),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                """
LEADER
BOARD""",
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff6DC3BC),
                ),
              ),
            ),
          ),
          Divider(
            color: Color(0xffEEEEEE),
            thickness: 2,
          ),
          Expanded(
            child: FutureBuilder<List<LeaderboardScore>>(
              future: score.getAll(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<LeaderboardScore>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Color(0xffEEEEEE),
                        thickness: 2,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ScoreWidget(
                        score: snapshot.data[index].score,
                        name: snapshot.data[index].name,
                        rank: index+1,
                      );
                    },
                  );
                }
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Loading scores ...",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
