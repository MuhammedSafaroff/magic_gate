import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final _ipAddress = 'ipAddress';

  static PreferencesService? _instance;
  static SharedPreferences? _prefs;

  PreferencesService._();

  static Future<PreferencesService> get instance async {
    _instance ??= PreferencesService._();

    _prefs = await SharedPreferences.getInstance();

    return _instance!;
  }

//ip address
  String get getIpAddress => _prefs!.getString(_ipAddress) ?? '';

  void setIpAddress(String ipAddress) {
    _prefs!.setString(_ipAddress, ipAddress);
  }

  void removeIpAddress() {
    _prefs!.remove(_ipAddress);
  }
}
