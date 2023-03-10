import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

class Location {
  Position? currentPosition;

  Future<Position?> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    return currentPosition;
  }
}
