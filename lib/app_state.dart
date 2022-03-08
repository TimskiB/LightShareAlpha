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
    _userid = prefs.getString('ff_userid') ?? _userid;
    _deviceID = prefs.getString('ff_deviceID') ?? _deviceID;
    _deviceName = prefs.getString('ff_deviceName') ?? _deviceName;
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

  String _userid = 'default-id';
  String get userid => _userid;
  set userid(String _value) {
    _userid = _value;
    prefs.setString('ff_userid', _value);
  }

  String _deviceID = '';
  String get deviceID => _deviceID;
  set deviceID(String _value) {
    _deviceID = _value;
    prefs.setString('ff_deviceID', _value);
  }

  String _deviceName = '';
  String get deviceName => _deviceName;
  set deviceName(String _value) {
    _deviceName = _value;
    prefs.setString('ff_deviceName', _value);
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
