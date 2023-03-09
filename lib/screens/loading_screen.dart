import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:clima/services/location.dart';

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
    getLoc = await locationObject.getlocation();
    print('data: $getLoc');
    return true;
  }

  void initState() {
    readLocation();
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LATD: ${getLoc?.latitude ?? "NA"}'),
            Text('LNGD: ${getLoc?.longitude ?? "NA"}'),
          ],
        ),
      ),
    );
  }
}
