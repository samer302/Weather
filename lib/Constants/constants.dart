

import 'package:weathertest/Constants/colors.dart';

class Constants{
  static const Map<String, int> backColors = {
    "01n": CustomColors.n_color,
    "02n": CustomColors.n_color,
    "03n": CustomColors.n_color,
    "04n": CustomColors.n_color,
    "01d": CustomColors.d_color,
    "02d": CustomColors.d_color,
    "03d": CustomColors.d_color,
    "04d": CustomColors.d_color,
  };
  static const Map<String,String> imageCards =
  {
    "01n": "assets/ni_clear.png",
    "02n": "assets/n_scattered.png",
    "03n": "assets/n_scattered.png",
    "04n": "assets/ni_cloud.png",
    "01d": "assets/da_clear.png",
    "02d": "assets/d_scattered.png",
    "03d": "assets/d_scattered.png",
    "04d": "assets/da_cloud.png",

  };
  static const Map<String, String> messages = {
    "01n": "Peacful\nNight",
    "02n": "Cosy\nNight",
    "03n": "Cosy\nNight",
    "04n": "A Night\nTo Enjoy\nHome",
    "01d": "Sunny\nDay\n to walk",
    "02d": "Nice\nDay",
    "03d": "Nice\nDay",
    "04d": "Take\nYour\nJacket",
  };
}