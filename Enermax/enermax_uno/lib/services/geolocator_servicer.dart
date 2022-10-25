import 'package:geolocator/geolocator.dart';

class GeoLocatorServices {
  // ignore: non_constant_identifier_names
  get GeolocationPermission => null;

  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: GeolocationPermission);
  }
}
