import 'dart:io';
import 'package:aqua_explore/services/geolocalisation_services.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/app_button.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = false;
  CameraPosition? actualPosition;
  Set<Marker> markers = {};
  int selectedCategory = 0;

  Future<void> determinePosition(GoogleMapController e) async {
    // await loadMarkers();
    actualPosition = await GeoLocationServices.getCurrentCameraPosition();
    e.animateCamera(CameraUpdate.newCameraPosition(actualPosition ?? _redStar));
    setState(() {});
  }

  static const CameraPosition _redStar = CameraPosition(target: LatLng(6.371014, 2.410017), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Platform.isLinux
          ? AppButton(
              foregroundColor: Colors.white, backgroundColor: secondaryOrange, text: "Test", onPressed: () {})
          : isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    GoogleMap(
                      // markers: getMarkers(selectedCategory),
                      polygons: {
                        const Polygon(
                          polygonId: PolygonId("PolygonId"),
                        )
                      },
                      zoomControlsEnabled: false,
                      initialCameraPosition: actualPosition ?? _redStar,
                      onMapCreated: (e) => determinePosition(e),
                    ),
                    Positioned(
                        top: 50,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: primaryBlue,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "American seas",
                                      style: TextStyle(color: primaryBlue),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(shape: BoxShape.circle),
                                  child: const Icon(Icons.search))
                            ],
                          ),
                        ))
                  ],
                ),
    );
  }
}
