
import 'package:weathertest/Models/List/clouds.dart';
import 'package:weathertest/Models/List/main.dart';
import 'package:weathertest/Models/List/weather.dart';
import 'package:weathertest/Models/List/wind.dart';
import 'package:weathertest/Models/sys.dart';


import '../Constants/DateUtility.dart';


class DayWeatherDetails {
   var dt;
   Main main;
   List<Weather> weather;
   Clouds clouds;
   Wind wind;
   Sys sys;
   String dtTxt;

   DayWeatherDetails(
       {this.dt,
          this.main,
          this.weather,
          this.clouds,
          this.wind,
          this.sys,
          this.dtTxt});

   DayWeatherDetails.fromJson(Map<String, dynamic> json) {
      dt = json['dt'];
      main = json['main'] != null ? new Main.fromJson(json['main']) : null;
      if (json['weather'] != null) {
         weather = new List<Weather>();
         json['weather'].forEach((v) {
            weather.add(new Weather.fromJson(v));
         });
      }
      clouds =
      json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
      wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
      sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
      dtTxt = DateUtils.formatDate(json['dt_txt']);
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['dt'] = this.dt;
      if (this.main != null) {
         data['main'] = this.main.toJson();
      }
      if (this.weather != null) {
         data['weather'] = this.weather.map((v) => v.toJson()).toList();
      }
      if (this.clouds != null) {
         data['clouds'] = this.clouds.toJson();
      }
      if (this.wind != null) {
         data['wind'] = this.wind.toJson();
      }
      if (this.sys != null) {
         data['sys'] = this.sys.toJson();
      }
      data['dt_txt'] = this.dtTxt;
      return data;
   }


}