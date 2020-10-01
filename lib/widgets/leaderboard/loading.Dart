import 'package:fingSwipeV2/main.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6FC3BC)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            language.translateToFrench ? "Chargement des scores ..." : "Loading scores ...",
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
