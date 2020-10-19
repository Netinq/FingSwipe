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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);

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
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
