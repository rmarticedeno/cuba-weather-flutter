import 'package:cuba_weather_dart/cuba_weather_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:cuba_weather_redcuba_dart/src/models/weather_model.dart'
    as redCuba;

import 'package:cuba_weather/src/widgets/widgets.dart';

double radius = 0.0;
double size = 30.0;

class ActualStateWidget extends StatelessWidget {
  final WeatherModel weather;

  ActualStateWidget({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Estado actual:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        LastUpdatedWidget(dateTime: weather.dateTime),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${weather.temperature.round()}',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '°C',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  BoxedIcon(
                    WeatherIcons.thermometer,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      BoxedIcon(
                        WeatherIcons.barometer,
                        color: Colors.white,
                      ),
                      Text(
                        'Presión: ${weather.pressure.round()} hPa',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      BoxedIcon(
                        WeatherIcons.humidity,
                        color: Colors.white,
                      ),
                      Text(
                        'Humedad: ${weather.humidity.round()}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Viento:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                      icon: _parseWindVelocity(weather.windVelocity),
                      color: Colors.white,
                      iconSize: size,
                      onPressed: () {}),
                  Text(
                    '${weather.windVelocity.round()} Km/h',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                width: 50,
              ),
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Transform.rotate(
                        angle: radius,
                        child: IconButton(
                          icon: _parseWindDirection(weather.windDirection),
                          color: Colors.white,
                          iconSize: size,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: Text(
                          weather.windDirectionDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Icon _parseWindDirection(redCuba.CardinalPoint input) {
    switch (input) {
      case redCuba.CardinalPoint.North:
        radius = 0.0;
        size = 30;
        return Icon(WeatherIcons.direction_down);
      case redCuba.CardinalPoint.North_Northeast:
        radius = 0.3926991;
        size = 30;
        return Icon(WeatherIcons.direction_down);
      case redCuba.CardinalPoint.Northeast:
        radius = 0.0;
        size = 35;
        return Icon(WeatherIcons.direction_down_left);
      case redCuba.CardinalPoint.East_Northeast:
        radius = 0.3926991;
        size = 37;
        return Icon(WeatherIcons.direction_down_left);
      case redCuba.CardinalPoint.East:
        radius = 0.0;
        size = 30;
        return Icon(WeatherIcons.direction_left);
      case redCuba.CardinalPoint.East_Southeast:
        radius = 0.3926991;
        size = 30;
        return Icon(WeatherIcons.direction_left);
      case redCuba.CardinalPoint.Southeast:
        radius = 0.0;
        size = 35;
        return Icon(WeatherIcons.direction_up_left);
      case redCuba.CardinalPoint.South_Southeast:
        radius = 0.3926991;
        size = 35;
        return Icon(WeatherIcons.direction_up_left);
      case redCuba.CardinalPoint.South:
        radius = 0.0;
        size = 30;
        return Icon(WeatherIcons.direction_up);
      case redCuba.CardinalPoint.South_Southwest:
        radius = 0.3926991;
        size = 30;
        return Icon(WeatherIcons.direction_up);
      case redCuba.CardinalPoint.Southwest:
        radius = 0.0;
        size = 35;
        return Icon(WeatherIcons.direction_up_right);
      case redCuba.CardinalPoint.West_Southwest:
        radius = 0.3926991;
        size = 35;
        return Icon(WeatherIcons.direction_up_right);
      case redCuba.CardinalPoint.West:
        radius = 0.0;
        size = 30;
        return Icon(WeatherIcons.direction_right);
      case redCuba.CardinalPoint.West_Northwest:
        radius = 0.3926991;
        size = 30;
        return Icon(WeatherIcons.direction_right);
      case redCuba.CardinalPoint.Northwest:
        radius = 0.0;
        size = 35;
        return Icon(WeatherIcons.direction_down_right);
      case redCuba.CardinalPoint.North_Northwest:
        radius = 0.3926991;
        size = 35;
        return Icon(WeatherIcons.direction_down_right);
      default:
        radius = 0.0;
        size = 30;
        return Icon(WeatherIcons.wind);
    }
  }

  static Icon _parseWindVelocity(double x) {
    if (x < 2)
      return Icon(WeatherIcons.wind_beaufort_0);
    else if (x < 6)
      return Icon(WeatherIcons.wind_beaufort_1);
    else if (x < 12)
      return Icon(WeatherIcons.wind_beaufort_2);
    else if (x < 20)
      return Icon(WeatherIcons.wind_beaufort_3);
    else if (x < 29)
      return Icon(WeatherIcons.wind_beaufort_4);
    else if (x < 39)
      return Icon(WeatherIcons.wind_beaufort_5);
    else if (x < 50)
      return Icon(WeatherIcons.wind_beaufort_6);
    else if (x < 62)
      return Icon(WeatherIcons.wind_beaufort_7);
    else if (x < 75)
      return Icon(WeatherIcons.wind_beaufort_8);
    else if (x < 89)
      return Icon(WeatherIcons.wind_beaufort_9);
    else if (x < 103)
      return Icon(WeatherIcons.wind_beaufort_10);
    else if (x < 118)
      return Icon(WeatherIcons.wind_beaufort_11);
    else
      return Icon(WeatherIcons.wind_beaufort_12);
  }
}