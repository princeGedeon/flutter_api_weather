import 'dart:convert';

import 'package:meteo_app/services/data_converter.dart';

class APIResponse{
  String cod;
  int message;
  int cnt;
  List<Forecast> list;

  APIResponse({required this.cod, required this.message, required this.cnt,required this.list});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      cod: json["cod"],
      message: json["message"],
      cnt:json["cnt"],
     list:DataConverter().listMappable(json["list"]).map((e) => Forecast.fromJson(e)).toList(),
     /* list: List.of(json["list"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),*/
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cod": this.cod,
      "message": this.message,
      "cnt": this.cnt,
      "list": this.list,
    };
  }
//

}
class Forecast{
  int dt;
  Main main;
  List<Weather> weather;
  Wind wind;
  Clouds clouds;
  int visibility;
  String dt_txt;

  Forecast({required this.dt, required this.main,required this.weather,required this.wind,required this.clouds,
  required  this.visibility,required this.dt_txt});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      dt:json["dt"],
      main: Main.fromJson(json["main"]),
      weather: DataConverter().listMappable(json["weather"]).map((e) => Weather.fromJson(e)).toList(),
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      visibility: json["visibility"],
      dt_txt: json["dt_txt"],
    );
  }
//

}

class Main{
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double sea_level;
  double grnd_level;
  double humidity;
  double temp_kf;

  Main({required this.temp,required this.feels_like,required this.temp_min,required this.temp_max,required this.pressure,
  required this.sea_level,required this.grnd_level,required this.humidity, required this.temp_kf});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"].toDouble(),
      feels_like:json["feels_like"].toDouble(),
      temp_min: json["temp_min"].toDouble(),
      temp_max: json["temp_max"].toDouble(),
      pressure: json["pressure"].toDouble(),
      sea_level: json["sea_level"].toDouble(),
      grnd_level: json["grnd_level"].toDouble(),
      humidity:json["humidity"].toDouble(),
      temp_kf: json["temp_kf"].toDouble(),
    );
  }
//

}

class Weather{
  int id;
  String main;
  String description;
  String icon;

  Weather({required this.id,required this.main,required this.description,required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(

      id: json["id"],
      main: json["main"],
      description:json["description"],
      icon: json["icon"],
    );
  }
//

}

class Clouds{
  int all;

  Clouds({required this.all});

  Map<String, dynamic> toJson() {
    return {
      "all": this.all,
    };
  }

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all:json["all"],
    );
  }
//

}

class Wind{
  double speed;
  int? def;
  double gust;

  Wind({required this.speed,required this.def,required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed:json["speed"].toDouble(),
      def: json["def"],
      gust:json["gust"].toDouble(),
    );
  }
//

}
