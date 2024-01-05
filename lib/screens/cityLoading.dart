import 'package:cloud/screens/location_screen.dart';
import 'package:cloud/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CityLoading extends StatefulWidget {
  CityLoading({required this.cityName});
  final cityName;
  @override
  _CityLoadingState createState() => _CityLoadingState();
}

class _CityLoadingState extends State<CityLoading> {
  WeatherModel weatherModel = WeatherModel();

  void loadCity() async {
    var weatherData = await weatherModel.getCityWeather(widget.cityName.trim());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadCity();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitWaveSpinner(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
