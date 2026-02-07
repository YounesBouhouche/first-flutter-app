import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _dynamicColors = true;
  String? _language;

  ThemeMode get themeMode => _themeMode;
  bool get dynamicColors => _dynamicColors;
  String? get language => _language;

  Settings() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? 0];
    _dynamicColors = prefs.getBool('dynamicColors') ?? true;
    _language = prefs.getString('language');
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
    notifyListeners();
  }

  Future<void> updateDynamicColors(bool dynamicColors) async {
    _dynamicColors = dynamicColors;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dynamicColors', dynamicColors);
    notifyListeners();
  }

  Future<void> updateLanguage(String? language) async {
    _language = language;
    final prefs = await SharedPreferences.getInstance();
    if (language == null) {
      await prefs.remove('language');
    } else {
      await prefs.setString('language', language);
    }
    notifyListeners();
  }
}
