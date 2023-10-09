import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChasePointModel {
  final int id;
  final String title;
  final LatLng coordinates;

  ChasePointModel({
    required this.id,
    required this.title,
    required this.coordinates,
  });
}

final List<ChasePointModel> chasePointList = [
    ChasePointModel(
      id: 1,
      title: "Cape Point",
      coordinates: const LatLng(-34.052222, 20.424095),
    ),
    ChasePointModel(
      id: 2,
      title: "Cape Town",
      coordinates: const LatLng(-33.17222, 24.424095),
    ),
    ChasePointModel(
      id: 3,
      title: "Durban",
      coordinates: const LatLng(-32.052222, 22.424095),
    ),
    ChasePointModel(
      id: 4,
      title: "Johannesburg",
      coordinates: const LatLng(-31.805833, 27.915278),
    ),
    ChasePointModel(
      id: 5,
      title: "Pretoria",
      coordinates: const LatLng(-30.195833, 25.729444),
    ),
    ChasePointModel(
      id: 6,
      title: "Bloemfontein",
      coordinates: const LatLng(-28.216667, 29.166667),
    ),
    ChasePointModel(
      id: 7,
      title: "Pretoria",
      coordinates: const LatLng(-28.195833, 20.729444),
    )
  ];
