import 'package:shared_preferences/shared_preferences.dart';

class PlaybackConfigRepository {
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  final SharedPreferences _preferences;

  PlaybackConfigRepository(this._preferences);

  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    return _preferences.getBool(_muted) ?? false; // ?? false 는 null 일 경우 false
  }

  bool isAutoplay() {
    return _preferences.getBool(_autoplay) ?? false;
  }
}
