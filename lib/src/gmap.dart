import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // แผนที่ Google Map
import 'package:location/location.dart'; // GPS Location

class Gmap extends StatefulWidget {
  @override
  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basic 2021'),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.home),
          //   onPressed: () {
          //     setState(() {
          //       _goHome();
          //     });
          //   }, ),
          IconButton(
              icon: Icon(Icons.my_location_rounded),
              onPressed: () {
                setState(() {
                  _goToMe();
                });
              }, )
        ]),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: 
              Text('data')
            // Column(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           'Permission status: ${_permissionGranted ?? "unknown"}',
            //           style: Theme.of(context).textTheme.bodyText1,
            //         ),
            //         Row(
            //           children: <Widget>[
            //             Container(
            //               margin: const EdgeInsets.only(right: 42),
            //               child: ElevatedButton(
            //                 child: const Text('Check'),
            //                 onPressed: _checkPermissions,
            //               ),
            //             ),
            //             ElevatedButton(
            //               child: const Text('Request'),
            //               onPressed: _permissionGranted == PermissionStatus.granted
            //                   ? null
            //                   : _requestPermission,
            //             )
            //           ],
            //         )
            //       ],
            //     ), /// Check Permission - ตรวจสอบ การอนุญาติเข้าถึง Location
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text('Service enabled: ${_serviceEnabled ?? "unknown"}',
            //             style: Theme.of(context).textTheme.bodyText1),
            //         Row(
            //           children: <Widget>[
            //             Container(
            //               margin: const EdgeInsets.only(right: 42),
            //               child: ElevatedButton(
            //                 child: const Text('Check'),
            //                 onPressed: _checkService,
            //               ),
            //             ),
            //             ElevatedButton(
            //               child: const Text('Request'),
            //               onPressed: _serviceEnabled == true ? null : _requestService,
            //             )
            //           ],
            //         )
            //       ],
            //     ), /// Check Service - ตรวจสอบ อุปกรณ์ว่าเปิด Location อยู่หรือไม่
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           'Listen location: ' + (_error ?? '${_location ?? "unknown"}'),
            //           style: Theme.of(context).textTheme.bodyText1,
            //         ),
            //         Row(
            //           children: <Widget>[
            //             Container(
            //               margin: const EdgeInsets.only(right: 42),
            //               child: ElevatedButton(
            //                 child: const Text('Listen'),
            //                 onPressed:
            //                 _locationSubscription == null ? _listenLocation : null,
            //               ),
            //             ),
            //             ElevatedButton(
            //               child: const Text('Stop'),
            //               onPressed: _locationSubscription != null ? _stopListen : null,
            //             )
            //           ],
            //         ),
            //       ],
            //     ), /// Listen Location จับ Location ทุก ๆ  5 วินาที
            //   ],
            // ),
          ),
          Expanded(
            flex: 4,
            child:
            Stack(
              children: [
                getGmap(),
                // Positioned(
                //   top: 16,
                //   right: 16, //kIsWeb ? 60 : 16,
                //   child: FloatingActionButton(
                //     onPressed: () {
                //       setState(() {
                //         _goToMe();
                //       });
                //     },
                //     child: Icon(Icons.my_location,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Parameter Start
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();
  BitmapDescriptor _markerIcon;

  // final Location location = Location();
  // PermissionStatus _permissionGranted;
  // bool _serviceEnabled;
  // bool _loading = false;
  // LocationData _location;
  // String _error;
  // StreamSubscription<LocationData> _locationSubscription;
  // LocationData currentLocation;
  //
  // //StreamSubscription _locationSubscription;
  // Location _locationTracker = Location();
  // Marker marker;
  // Circle circle;
  /// Parameter End

  /// Location Start
  // // เช็ค สิทธ์
  // Future<void> _checkPermissions() async {
  //   final PermissionStatus permissionGrantedResult =
  //   await location.hasPermission();
  //   setState(() {
  //     _permissionGranted = permissionGrantedResult;
  //   });
  // }
  // // ร้องขอ สิทธ์
  // Future<void> _requestPermission() async {
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     final PermissionStatus permissionRequestedResult =
  //     await location.requestPermission();
  //     setState(() {
  //       _permissionGranted = permissionRequestedResult;
  //     });
  //   }
  // }
  // // เช็ค การเปิด Location
  // Future<void> _checkService() async {
  //   final bool serviceEnabledResult = await location.serviceEnabled();
  //   setState(() {
  //     _serviceEnabled = serviceEnabledResult;
  //   });
  // }
  // // ร้องขอ การเปิด Location
  // Future<void> _requestService() async {
  //   if (_serviceEnabled == true) {
  //     return;
  //   }
  //   final bool serviceRequestedResult = await location.requestService();
  //   setState(() {
  //     _serviceEnabled = serviceRequestedResult;
  //   });
  // }
  // // ตรวจจับ Location
  // Future<void> _listenLocation() async {
  //   _locationSubscription =
  //       location.onLocationChanged.handleError((dynamic err) {
  //         if (err is PlatformException) {
  //           setState(() {
  //             _error = err.code;
  //           });
  //         }
  //         _locationSubscription?.cancel();
  //         setState(() {
  //
  //           _locationSubscription = null;
  //         });
  //       }).listen((LocationData currentLocation) {
  //         setState(() {
  //           _error = null;
  //           _location = currentLocation;
  //         });
  //       });
  //   setState(() {});
  // }
  // // หยุดตรวจจับ Location
  // Future<void> _stopListen() async {
  //   _locationSubscription?.cancel();
  //   setState(() {
  //     _locationSubscription = null;
  //   });
  // }
  /// Location End

  /// Google Maps Start
  // แผนที่ google maps
  getGmap(){
    return GoogleMap(
      markers: _markers,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(13.7650836, 100.5379664),
        zoom: 16,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      onTap: (latlng) {
        _handleTap(latlng);
      },
    );
  }
  // บกมาร์ก ในแผนที่
  _handleTap(LatLng point) {
    setState(() {
      _markers.clear();

      _markers.add(Marker(
        markerId: MarkerId(LatLng(13.9272683,100.5330269).toString()),
        position: LatLng(13.9272683,100.5330269),
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon: _markerIcon,
      ));

      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueMagenta),
      ));
    });

    // setState(() {
    //   _goToMe(point);
    // });

  }
  // ไปที่ location ตัวเอง
  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    //currentLocation = await _listenLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(13.9272683,100.5330269), //Bis Group
          zoom: 16,
        )));

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(LatLng(13.9272683,100.5330269).toString()),
        position: LatLng(13.9272683,100.5330269),
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon: _markerIcon,
      ));
    });

  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'my_location.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  //
  // Future _goHome() async {
  //   print('_goHome');
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(13.9272683,100.5330269), //Bis Group
  //         zoom: 18,
  //       )));
  // }
  /// Google Maps End
}
