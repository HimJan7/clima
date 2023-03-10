import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '9a0961310414844f06c5fdb1449e94a7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  Position? getLoc;

  Future<bool> readLocation() async {
    Location locationObject = Location();
    getLoc = await locationObject.getLocation();
    NetworkHelper getCondition = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${getLoc?.latitude}&lon=${getLoc?.longitude}&appid=$apiKey');

    var weatherData = await getCondition.getData();

    setState(() {
      lat = getLoc?.latitude;
      lon = getLoc?.longitude;
    });
    //getData();
    return true;
  }

  void initState() {
    super.initState();
    readLocation();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LATD: ${lat ?? "NA"}'),
            Text('LNGD: ${lon ?? "NA"}'),
          ],
        ),
      ),
    );
  }
}
