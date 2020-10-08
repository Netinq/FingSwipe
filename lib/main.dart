
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/end_game_page.dart';
import 'pages/game_page_v2.dart';
import 'pages/leaderboard_page.dart';
import 'pages/menu_page.dart';
import 'providers/game_provider.dart';
import 'providers/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Game(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          'menu':  (context) => MenuPage(),
          'normalGame': (context) => GamePageV2(),
          'normalEnd': (context) => NormalEnd(),
          'leaderboard': (context) => LeaderboardPage(),
        },
        initialRoute: 'normalGame',
      ),
    ),
  );
}


