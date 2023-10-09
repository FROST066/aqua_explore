import 'dart:io';
import 'package:aqua_explore/services/geolocalisation_services.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/small_river_widget.dart';
import 'package:aqua_explore/widgets/app_button.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
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
    await loadMarkers();
    actualPosition = await GeoLocationServices.getCurrentCameraPosition();
    e.animateCamera(CameraUpdate.newCameraPosition(actualPosition ?? _redStar));
    setState(() {});
  }

  static const CameraPosition _redStar = CameraPosition(target: LatLng(6.371014, 2.410017), zoom: 0);

  Future<void> loadMarkers() async {
    print("Loading marker");
    final greenMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/markers/marker_yellow.png");
    final tempMarkers = List.generate(
      3,
      (index) => Marker(
        markerId: MarkerId("Marker$index"),
        icon: greenMarker,
        position: _redStar.target,
        onTap: () => showRiverDetails(context),
      ),
    );
    markers = tempMarkers.toSet();
  }

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
                      markers: markers,
                      mapType: MapType.satellite,
                      zoomControlsEnabled: false,
                      initialCameraPosition: actualPosition ?? _redStar,
                      onMapCreated: (e) => determinePosition(e),
                    ),
                    Positioned(
                        top: 50,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                                  decoration:
                                      const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                  child: const Icon(
                                    Icons.search,
                                    color: primaryBlue,
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
    );
  }
}

void showRiverDetails(BuildContext context) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    animationType: DialogTransitionType.scale,
    curve: Curves.decelerate,
    duration: const Duration(milliseconds: 700),
    builder: (BuildContext ctx) => const Center(child: SmallRiverWidget()),
  );
}
