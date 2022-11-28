import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:meteo_app/models/geoposition.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
class LocationService{


  Future<LocationData?> getPosition() async {
    try {
      Location location = Location();
      return location.getLocation();
    } on PlatformException catch (error) {
      print("Nous avons une erreur pour recuperer la position");
      return null;
    }
  }

    Future<GeoPosition?> getCity() async{
      final position=await getPosition();
      if (position==null) return null;
      final lat=position.latitude??0;
      final lon=position.longitude??0;

      List<geocoding.Placemark> placemarks=await geocoding.placemarkFromCoordinates(lat, lon);

      final firstChoice=placemarks.first;

      final GeoPosition geoPosition=GeoPosition(city: firstChoice.locality??"", lat: lat, lon: lon);
    return geoPosition;
    }

  Future<GeoPosition?> getCoordsFromCity(String city) async{
    final placemarks=await geocoding.locationFromAddress(city);
    if (placemarks.isEmpty) return null;
    final bestchoices=placemarks.first;
    return GeoPosition(city: city, lat: bestchoices.latitude, lon: bestchoices.longitude);

  }
  }


