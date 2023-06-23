import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static final Preference instance = Preference();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Preference();

  Future<void> set<Type>(String key, dynamic value) async {
    try {
      final prefs = await _prefs;

      switch (Type) {
        case int:
          await prefs.setInt(key, value);
          break;
        case bool:
          await prefs.setBool(key, value);
          break;
        case double:
          await prefs.setDouble(key, value);
          break;
        case String:
          await prefs.setString(key, value);
          break;
        case const (List<String>):
          await prefs.setStringList(key, value);
          break;
      }
    } on Exception catch (_) {}
  }

  Future<dynamic> get<Type>(String key) async {
    final prefs = await _prefs;
    switch (Type) {
      case int:
        return prefs.getInt(key) ?? 0;
      case bool:
        return prefs.getBool(key) ?? false;
      case double:
        return prefs.getDouble(key) ?? 0.0;
      case String:
        return prefs.getString(key) ?? '';
      case const (List<String>):
        return prefs.getStringList(key) ?? <String>[];
    }
  }

  Future<void> removeKey(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  // Future<int> getInt(String key) async {
  //   final prefs = await _prefs;
  //   return prefs.getInt(key) ?? 0;
  // }

  // Future<bool> getBool(String key) async {
  //   final prefs = await _prefs;
  //   return prefs.getBool(key) ?? false;
  // }

  // Future<double> getDouble(String key) async {
  //   final prefs = await _prefs;
  //   return prefs.getDouble(key) ?? 0.0;
  // }

  // Future<String> getString(String key) async {
  //   final prefs = await _prefs;
  //   return prefs.getString(key) ?? '';
  // }

  // Future<List<String>> getStringList(String key) async {
  //   final prefs = await _prefs;
  //   return prefs.getStringList(key) ?? <String>[];
  // }
}
