


import 'package:kibanda_kb/delivery/app_keys.dart';
import 'package:location_geocoder/location_geocoder.dart';
class GeolocationService {
  /// Get the locations from PIN
  static Future<List<Address>> getLocationFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    final LocatitonGeocoder geocoder =
        LocatitonGeocoder(AppKeys.googleAPIKeyAndroid);
    final addresses = await geocoder
        .findAddressesFromCoordinates(Coordinates(latitude, longitude));
    return addresses;
  }

  /// Query the list with a query
  static Future<List<Address>> getAddressesFromQuery(
      {required String address}) async {
    final LocatitonGeocoder geocoder =
        LocatitonGeocoder(AppKeys.googleAPIKeyAndroid);
    final addresses = await geocoder.findAddressesFromQuery(address);
    return addresses;
  }
}
