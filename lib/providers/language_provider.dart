import 'package:flutter/foundation.dart';

import '../models/local_storage.dart';

class LanguageProvider with ChangeNotifier {
  bool translateToFrench = false;

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

  void toFrench() async {
    translateToFrench = true;
    notifyListeners();
    await localStorage.storeLanguagePrefs('fr');
  }

  void toEnglish() async {
    translateToFrench = false;
    notifyListeners();
    await localStorage.storeLanguagePrefs('en');
  }
}
