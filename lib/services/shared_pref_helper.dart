import 'package:shared_preferences/shared_preferences.dart';
import '../utils/sp_keys.dart';

class SharedPreferencesManager {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getUserId() {
    return _preferences?.getString(spUserId);
  }

  static Future<bool> setUserId(String value) {
    return _preferences?.setString(spUserId, value) ?? Future.value(false);
  }

  static clear() {
    return _preferences?.clear();
  }
}
