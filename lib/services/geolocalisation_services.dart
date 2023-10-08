import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

class GeoLocationServices {
  static loc.Location location = loc.Location();
  static loc.LocationData? locationData;

  LatLng? get getLoc =>
      locationData == null ? null : LatLng(locationData!.latitude!, locationData!.longitude!);
  static Future<CameraPosition?> getCurrentCameraPosition() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return null;
      }
    }
    locationData = await location.getLocation();
    debugPrint(
        "------UserLocation got------------lat: ${locationData!.latitude} long: ${locationData!.longitude}");
    return CameraPosition(target: LatLng(locationData!.latitude!, locationData!.longitude!), zoom: 14);
  }
}
