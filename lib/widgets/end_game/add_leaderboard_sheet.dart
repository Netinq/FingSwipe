import 'package:fingSwipeV2/models/score_api.dart';
import 'package:fingSwipeV2/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';

class AddToLeaderboardModalSheet extends StatefulWidget {
  @override
  _AddToLeaderboardModalSheetState createState() =>
      _AddToLeaderboardModalSheetState();
}

class _AddToLeaderboardModalSheetState
    extends State<AddToLeaderboardModalSheet> {
  TextEditingController _controller;

  final scoreApi = Score();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    final game = Provider.of<Game>(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        language.translateToFrench ? "Entrer un nom" : "Enter a name",
      ),
      content: TextFormField(
        controller: _controller,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            print(_controller.value);
            scoreApi.store(_controller.text, game.score);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
