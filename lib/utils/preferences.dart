import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = new Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  SharedPreferences _pref;

  init() async {
    this._pref = await SharedPreferences.getInstance();
  }

  get scale{
    return _pref.getBool('scale')??false;
  }

  set scale(bool value){
    _pref.setBool('scale', value);
  }
}
