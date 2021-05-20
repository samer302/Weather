import 'package:weathertest/Models/day_details.dart';

import 'city.dart';

class WeatherResponse {
  String cod;
  var message;
  var cnt;
  List<DayWeatherDetails> list;
  City city;

  WeatherResponse({this.cod, this.message, this.cnt, this.list, this.city});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<DayWeatherDetails>();
      json['list'].forEach((v) {
        list.add(new DayWeatherDetails.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    return data;
  }
}
