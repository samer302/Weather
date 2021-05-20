import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertest/Constants/constants.dart';
import 'package:weathertest/Models/day_details.dart';
import 'package:weathertest/Widget/customizeText.dart';
import 'package:weathertest/bloc/weather_bloc.dart';

// ignore: must_be_immutable
class WeatherCard extends StatelessWidget {
  DayWeatherDetails data;
  WeatherCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.height)*0.19,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.transparent,
          onPressed: () {
            BlocProvider.of<WeatherBloc>(context)
                .add(MoveToDetailsEvent(data: data));
          },
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomizeText(
                        title: data.dtTxt,
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 120,
                    child: Image.asset(
                    Constants.imageCards[data.weather[0].icon],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
