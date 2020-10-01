
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fingSwipeV2/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/end_game_page.dart';
import 'pages/game_page.dart';
import 'pages/leaderboard_page.dart';
import 'pages/menu_page.dart';
import 'providers/game_provider.dart';

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
          'normalGame': (context) => GamePage(),
          'normalEnd': (context) => NormalEnd(),
          'leaderboard': (context) => LeaderboardPage(),
        },
        home: MenuPage(),
      ),
    ),
  );
}


