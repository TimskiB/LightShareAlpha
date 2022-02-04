import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _displayName = prefs.getString('ff_displayName') ?? _displayName;
    _email = prefs.getString('ff_email') ?? _email;
  }

  SharedPreferences prefs;

  bool login = false;

  int chosen = 0;

  String uids = '';

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String _value) {
    _displayName = _value;
    prefs.setString('ff_displayName', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
