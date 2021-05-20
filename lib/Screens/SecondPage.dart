import 'package:flutter/material.dart';
import 'package:weathertest/Constants/constants.dart';
import 'package:weathertest/Models/day_details.dart';
import 'package:weathertest/Widget/customizeText.dart';
import 'package:weathertest/Widget/details_box.dart';

class WeatherDetailsWidget extends StatefulWidget {
  @override
  _WeatherDetailsWidgetState createState() => _WeatherDetailsWidgetState();
}

class _WeatherDetailsWidgetState extends State<WeatherDetailsWidget> {
  DayWeatherDetails data;
  List<Map<String, String>> otherInfo = [];

  double toCelsius(double k) {
    return k - 273.15;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments as DayWeatherDetails;
    otherInfo.add({
      "key": "Wind",
      "value": (data.wind.speed as num).toStringAsFixed(1) + "km/h"
    });
    otherInfo.add({
      "key": "Humidity",
      "value": (data.main.humidity as num).toStringAsFixed(1) + '%'
    });
    otherInfo.add({
      "key": "pressure",
      "value": (data.main.pressure as num).toStringAsFixed(1) + 'Pa'
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(Constants.backColors[data.weather[0].icon]),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomizeText(
                      title: Constants.messages[data.weather[0].icon],
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Image.asset(Constants.imageCards[data.weather[0].icon]),
            ),
            Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomizeText(
                      title: "Dubai",
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 45,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            toCelsius(data.main.temp).toStringAsFixed(1) +
                                String.fromCharCode(0x00B0),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: ListView.builder(
                          itemCount: otherInfo.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InfoBox(otherInfo[index]["key"],
                                otherInfo[index]["value"]);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }

}
