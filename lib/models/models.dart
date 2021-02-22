import 'dart:convert';

import '../utils/utils.dart';
import '../utils/utils.dart';

class Cities {
  List<City> items = new List();

  Cities();

  Cities.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final pais = new City.fromJson(item);
      items.add(pais);
    }
  }
}

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    this.values,
    this.name,
    this.cod,
  });

  Values values;
  String name;
  int cod;

  factory City.fromJson(Map<String, dynamic> json) => City(
        values: Values.fromJson(json["values"]),
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "values": values.toJson(),
        "name": name,
        "cod": cod,
      };
}

class Values {
  Values({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  double temp;
  double tempMin;
  double tempMax;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
        temp: json["temp"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "temp_min": tempMin,
        "temp_max": tempMax,
      };

  
}
double transformToFahrenheit(double celsius){
    return (1.8*celsius)+32;
}

String transform(bool scale, double value){
  if(scale) return format(value) + " °C";
  else{
    return format((1.8*value)+32) + " °F";
  }
}