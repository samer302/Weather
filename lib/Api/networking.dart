import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';



class ApiClient {
  static const String apiKey = "b72856ed394372cfbed603df597216f5";
  static const String baseUrl =
      "http://api.openweathermap.org/data/2.5/forecast?id=292223&appid=";

  final Client httpClient;

  ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<dynamic> callRequest({String url}) async {
    var responseJson;
    try {
      final response = await httpClient.get(baseUrl + apiKey);
      responseJson = _handleResponse(response);
    }catch (error) {
      return '404';
    }
    return responseJson;
  }


    dynamic _handleResponse(Response response) {
      switch (response.statusCode) {
        case 200:
          var responseJson = json.decode(response.body.toString());
          //print(responseJson);
          return responseJson;
      }
    }
}
