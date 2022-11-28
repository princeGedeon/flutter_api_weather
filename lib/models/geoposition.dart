class GeoPosition{
  String city;
  double lat;
  double lon;

  GeoPosition({required this.city,required this.lat,required this.lon});

  Map<String, dynamic> toMap() {
    return {
      "city": this.city,
      "lat": this.lat,
      "lon": this.lon,
    };
  }
}