import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '9a0961310414844f06c5fdb1449e94a7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  Position? getLoc;

  Future<void> readLocation() async {
    Location locationObject = Location();
    getLoc = await locationObject.getLocation();
    NetworkHelper getCondition = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${getLoc?.latitude}&lon=${getLoc?.longitude}&appid=$apiKey&units=metric');

    var weatherData = await getCondition.getData();

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        LocationWeather: weatherData,
      );
    }));
  }

  void initState() {
    super.initState();
    readLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
