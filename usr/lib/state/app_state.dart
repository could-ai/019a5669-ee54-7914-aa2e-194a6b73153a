import 'package:flutter/material.dart';

enum AppScreen { scrapz, sudonimz, myMail, settings }

class AppState extends ChangeNotifier {
  AppScreen _selectedScreen = AppScreen.scrapz;

  AppScreen get selectedScreen => _selectedScreen;

  void setSelectedScreen(AppScreen screen) {
    _selectedScreen = screen;
    notifyListeners();
  }
}
