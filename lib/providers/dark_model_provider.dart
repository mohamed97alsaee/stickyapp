import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModelProvider with ChangeNotifier {
  
  bool isDark = false;

  initializeDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool("isdark") ?? false;
    notifyListeners();
  }

  switchMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isdark", !isDark);
    initializeDarkMode();
  }
}
