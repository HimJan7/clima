import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

class Location {
  Position? currentPosition;

  Future<Position?> getlocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      print(currentPosition);
    } catch (e) {
      print(e);
    }
    return currentPosition;
  }
}
