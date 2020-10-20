import 'package:auto_size_text/auto_size_text.dart';
import 'package:fingSwipeV2/models/scroll_configuration.dart';
import 'package:flutter/material.dart';

class ScoresPage extends StatelessWidget {
  final List scores;

  const ScoresPage({Key key, this.scores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: ScrollConfiguration(
          behavior: NoScrollGlowBehaviour(),
          child: ListView.separated(
            itemCount: scores.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 30);
            },
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
                          scores[index].score.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffEEEEEE),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      scores[index].name,
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFFEEEEEE),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
