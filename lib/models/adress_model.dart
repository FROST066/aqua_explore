class AdressModel {
  String title;
  double latitude;
  double longitude;
  AdressModel({
    required this.title,
    required this.latitude,
    required this.longitude,
  });
}

final adressList = [
  AdressModel(title: "American Saes", latitude: 8.3, longitude: 10.34),
  AdressModel(title: "African Saes", latitude: 8.3, longitude: 10.34),
  AdressModel(title: "Asia Saes", latitude: 8.3, longitude: 10.34),
  AdressModel(title: "Europe Saes", latitude: 8.3, longitude: 10.34),
];
