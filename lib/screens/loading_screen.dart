import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geolocator_android/geolocator_android.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? _currentAddress;
  Position? _currentPosition;

  void getlocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);

    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(_currentPosition);
    print('end');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LAT: ${_currentPosition?.latitude ?? ""}'),
            Text('LNG: ${_currentPosition?.longitude ?? ""}'),
            Text('ADDRESS: ${_currentAddress ?? ""}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                getlocation();
              },
              child: const Text("Get Current Location"),
            )
          ],
        ),
      ),
    );
  }
}
