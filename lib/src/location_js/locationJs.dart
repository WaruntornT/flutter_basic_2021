@JS('navigator.geolocation') // navigator.geolocation namespace
library jslocation; // library name can be whatever you want

import "package:js/js.dart";
import 'package:flutter/foundation.dart' show kIsWeb;

@JS('getCurrentPosition') // Accessing method getCurrentPosition from Geolocation API
external void getCurrentPosition(Function success(GeolocationPosition pos));

@JS()
@anonymous
class GeolocationCoordinates {
  external double get latitude;
  external double get longitude;
  external double get altitude;
  external double get accuracy;
  external double get altitudeAccuracy;
  external double get heading;
  external double get speed;

  external factory GeolocationCoordinates(
      {double latitude,
        double longitude,
        double altitude,
        double accuracy,
        double altitudeAccuracy,
        double heading,
        double speed});
}

@JS()
@anonymous
class GeolocationPosition {
  external GeolocationCoordinates get coords;

  external factory GeolocationPosition({GeolocationCoordinates coords});
}

//And to call this :

// success(pos) {
//   try {
//     print(pos.coords.latitude);
//     print(pos.coords.longitude);
//   } catch (ex) {
//     print("Exception thrown : " + ex.toString());
//   }
// }
// _getCurrentLocation() {
//   if (kIsWeb) {
//     getCurrentPosition(allowInterop((pos) => success(pos)));
//   }
// }