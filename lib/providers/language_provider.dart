import 'package:fingSwipeV2/main.dart';
import 'package:flutter/foundation.dart';


class LanguageProvider with ChangeNotifier {
  bool translateToFrench = false;

  void toFrench() {
    translateToFrench = true;
    notifyListeners();
  }

  void toEnglish() {
    translateToFrench = false;
    notifyListeners();
  }
}