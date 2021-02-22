import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  bool _scale = false;

  bool get scale{
    return this._scale;
  }

  set scale(bool value){
    this._scale = value;
    notifyListeners();
  }

  initScale(bool value){
    this._scale = value;
  } 

}
