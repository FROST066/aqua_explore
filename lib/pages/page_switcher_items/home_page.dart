import 'package:aqua_explore/services/geolocalisation_services.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:aqua_explore/widgets/small_river_widget.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  CameraPosition? actualPosition;
  Set<Marker> markers = {};
  int selectedCategory = 0;
  static const CameraPosition _redStar = CameraPosition(target: LatLng(6.371014, 2.410017), zoom: 0);
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  Future<void> determinePosition(GoogleMapController e) async {
    _customInfoWindowController.googleMapController = e;
    await loadMarkers();
    actualPosition = await GeoLocationServices.getCurrentCameraPosition();
    e.animateCamera(CameraUpdate.newCameraPosition(actualPosition ?? _redStar));
    setState(() {});
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Future<void> loadMarkers() async {
    print("Loading marker");
    final yellowMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/markers/marker_yellow.png");
    final tempMarkers = List.generate(
      3,
      (index) => Marker(
        markerId: MarkerId("Marker$index"),
        icon: yellowMarker,
        position: actualPosition?.target ?? _redStar.target,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            const SmallRiverWidget(),
            actualPosition?.target ?? _redStar.target,
          );
        },
      ),
    );
    markers = tempMarkers.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            mapType: MapType.satellite,
            zoomControlsEnabled: false,
            initialCameraPosition: actualPosition ?? _redStar,
            onMapCreated: (e) => determinePosition(e),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 100,
            width: 300,
            offset: 50,
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
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
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
