import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static late final SharedPreferences _preferences;

  static Future<SharedPreferences> init() async => _preferences = await SharedPreferences.getInstance();

  AppPreferences._internal();

  static const String _prefTypeBool = "BOOL";
  static const String _prefTypeInteger = "INTEGER";
  static const String _prefTypeDouble = "DOUBLE";
  static const String _prefTypeString = "STRING";

  /// Constants for Preference-Keys
  static const String cachedData = "cachedData";
  static const String lastFetchTime = "lastFetchTime";

  //--------------------------------------------------- Public Preference Methods -------------------------------------------------------------
  static void removeValue({required String key}) {
    _preferences.remove(key);
  }
  static void setCachedData({required String data}) => _setPreference(prefName: cachedData, prefValue: data, prefType: _prefTypeString);
  static Future<String> getCachedData() async => await _getPreference(prefName: cachedData)??"";

  static void setFetchTimeData({required String data}) => _setPreference(prefName: lastFetchTime, prefValue: data, prefType: _prefTypeString);
  static Future<String> getFetchTimeData() async => await _getPreference(prefName: lastFetchTime)??"";

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  static Future<bool> _setPreference({required String prefName, required dynamic prefValue, required String prefType}) async {
    switch (prefType) {
      case _prefTypeBool:
        return _preferences.setBool(prefName, prefValue);
      case _prefTypeInteger:
        return _preferences.setInt(prefName, prefValue);
      case _prefTypeDouble:
        return _preferences.setDouble(prefName, prefValue);
      case _prefTypeString:
        return _preferences.setString(prefName, prefValue);
      default:
        return Future.value(false);
    }
  }

  static dynamic _getPreference({required prefName}) => _preferences.get(prefName);

  static Future<bool> clearPreference() => _preferences.clear();
}
