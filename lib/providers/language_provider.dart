import 'package:fingSwipeV2/models/local_cache_provider.dart';
import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier {
  bool translateToFrench = true;
  LocalStorage localStorage = LocalStorage();

  Future<void> getStoredLanguage() async {
    String languageStored = await localStorage.getStoredLanguage();
    switch (languageStored) {
      case 'en':
        translateToFrench = false;
        break;
      case 'fr':
        translateToFrench = true;
        break;
    }

    notifyListeners();
  }

  void toFrench() {
    translateToFrench = true;
    localStorage.storeLanguagePrefs('fr');
    notifyListeners();
  }

  void toEnglish() {
    translateToFrench = false;
    localStorage.storeLanguagePrefs('en');
    notifyListeners();
  }
}
