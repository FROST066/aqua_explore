// import 'package:aqua_explore/models/chase_point_model.dart';
import 'package:aqua_explore/models/chase_point_model.dart';
import 'package:aqua_explore/pages/quizz_page.dart';
import 'package:aqua_explore/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChasePage extends StatefulWidget {
  const ChasePage({Key? key}) : super(key: key);
  @override
  State<ChasePage> createState() => ChasePageState();
}

class ChasePageState extends State<ChasePage> {
  CameraPosition actualPosition = CameraPosition(target: chasePointList[4].coordinates, zoom: 4.9);
  Set<Marker> markers = {};

  Future<void> determinePosition(GoogleMapController e) async {
    await loadMarkers();
    // e.animateCamera(CameraUpdate.newCameraPosition(actualPosition ?? _redStar));
    setState(() {});
  }

  Future<void> loadMarkers() async {
    print("Loading marker");
    await Future.forEach(chasePointList, (e) async {
      final temp = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(20, 30)),
          "assets/images/numberMarkers/numberMarker${e.id}.png");
      markers.add(Marker(
        markerId: MarkerId("Marker${e.id}"),
        icon: temp,
        position: e.coordinates,
        onTap: () => Get.dialog(const QuizzPage(), barrierColor: const Color.fromRGBO(1, 97, 138, .9)),
      ));
    });
    print("Got ${markers.length} marker");
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
            initialCameraPosition: actualPosition,
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
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.public,
                            color: primaryBlue,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "0/6",
                            style: TextStyle(color: primaryBlue),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/coins.svg",
                            color: secondaryOrange,
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "0/6",
                            style: TextStyle(color: primaryBlue),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/unknown.svg",
                            color: Colors.black,
                            height: 18,
                            width: 18,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "1/600",
                            style: TextStyle(color: primaryBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
