import 'dart:convert';

import '../models/models.dart';

import 'package:flutter/services.dart' show rootBundle;

class DataProvider{
  Future<Cities> getData() async=>
    rootBundle.loadString("assets/data/cities.json").then((value){
      return Cities.fromJsonList(json.decode(value));
    });
  
}