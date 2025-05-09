import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<bool> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(_refreshTokenKey);

    if (refreshToken == null) return false;

    try {
      // Dummy refresh logic - replace with actual API call
      final newAccessToken = 'new-access-token-from-server';
      await prefs.setString(_accessTokenKey, newAccessToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}
