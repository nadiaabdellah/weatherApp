
import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;

  switch (condition) {
    case 'Sunny':
    case 'Clear':

      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;

    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;

    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Blizzard':
      return Colors.lightBlue;

  
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}