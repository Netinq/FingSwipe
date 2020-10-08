import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<bool> storeLanguagePrefs(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool confirm = await prefs.setString('language', language);
    return confirm;
  }

  Future<String> getStoredLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('language')){
      return prefs.getString('language');
    } else {
      await prefs.setString('language', 'en');
      return 'en';
    }
  }

  Future<bool> storeToCache(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int previousHighScore = prefs.getInt('storedScore') ?? 0;

    bool setNewScore = false;
    
    if (previousHighScore < score) {
      bool setNewScore = await prefs.setInt('storedScore', score);
      return setNewScore;
    }

    return setNewScore;
  }

  Future<int> getHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('storedScore')) {
      return prefs.getInt('storedScore');
    } else {
      return 0;
    }
  }
}
