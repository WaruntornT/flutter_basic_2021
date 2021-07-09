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
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDown_mayType = '1';//list_mapType.first.toString();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
    super.dispose();
  }

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
          //       _goHome(); // BIS Group
          //     });
          //   }, ),
          IconButton(
              icon: Icon(Icons.my_location_rounded),
              onPressed: () {setState(() {
                _goToMe(); // ไปที่ location
                });
              }, )
        ]),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    //hint: Text('เลือกทั้งหมด'),
                    //autofocus: true,
                    // Reduces the dropdowns height by +/- 50%
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: list_mapType.map((item) {
                      return new DropdownMenuItem(
                        value: item['id'].toString(),
                        child: Text(item['name'].toString()),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        dropDown_mayType = newVal;
                        if(newVal=='1'){_mapType = MapType.normal;}
                        if(newVal=='2'){_mapType = MapType.terrain;}
                        if(newVal=='3'){_mapType = MapType.satellite;}
                        if(newVal=='4'){_mapType = MapType.hybrid;}
                      });
                    },
                    value: dropDown_mayType,
                  ),
                ),
                CheckboxListTile(
                  title: Text('Traffic'),
                  //secondary: Icon(Icons.traffic),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBox_traffic,
                  onChanged: (bool value) {
                    setState(() {
                      checkBox_traffic = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('My Location'),
                  //secondary: Icon(Icons.traffic),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBox_myLocation,
                  onChanged: (bool value) {
                    setState(() {
                      checkBox_myLocation = value;
                    });
                  },
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            textColor: Colors.white,
                            height: 80.0,
                            color: Colors.blueAccent,
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.pin_drop_outlined, color: Colors.white,),
                                ),
                                Text(' บันทึกตำแหน่ง ', style : TextStyle(fontWeight: FontWeight.normal), )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
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
                //Text('data'),
                //getGmap(),
                FutureBuilder(
                  future: _getLocationAll(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if(_location.latitude == null || _location.longitude == null){
                        return CircularProgressIndicator();
                      }else{
                        return getGmap(_location);
                      }
                      // GoogleMap(
                      //   markers: _markers,
                      //   mapType: _mapType,
                      //   myLocationEnabled: checkBox_myLocation,
                      //   myLocationButtonEnabled: checkBox_myLocation,
                      //   trafficEnabled: checkBox_traffic,
                      //
                      //   initialCameraPosition: CameraPosition(
                      //     target: LatLng(13.7650836, 100.5379664),
                      //     zoom: 16,
                      //   ),
                      //   onMapCreated: (GoogleMapController controller) {
                      //     _controller.complete(controller);
                      //   },
                      //   onTap: (latlng) {
                      //     _handleTap(latlng);
                      //   },
                      // );
                      // return GoogleMap(
                      //   mapType: MapType.normal,
                      //   onMapCreated: _onMapCreated,
                      //   myLocationEnabled: true,
                      //   initialCameraPosition: CameraPosition(
                      //       target: LatLng(userLocation.latitude, userLocation.longitude),
                      //       zoom: 15),
                      // );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                  },
                ),
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
  MapType _mapType = MapType.normal;
  BitmapDescriptor _markerIcon;

  String dropDown_mayType;
  final List list_mapType = [
    {"id":1,"name":"Normal"},
    {"id":2,"name":"Terrian"},
    {"id":3,"name":"Satellite"},
    {"id":4,"name":"Hybrid"}
  ];
  bool checkBox_traffic = false;
  bool checkBox_myLocation = true;

  final Location location = Location();
  PermissionStatus _permissionGranted;
  bool _serviceEnabled;
  bool _loading = false;
  LocationData _location;
  String _error;
  StreamSubscription<LocationData> _locationSubscription;
  LocationData currentLocation;
  /// Parameter End

  /// Location Start
  // // เช็ค สิทธ์
  // Future<void> _checkPermissions() async {
  //   final PermissionStatus permissionGrantedResult =
  //   await location.hasPermission();
  //   setState(() {_permissionGranted = permissionGrantedResult;});
  // }
  // // ร้องขอ สิทธ์
  // Future<void> _requestPermission() async {
  //   if (_permissionGranted != PermissionStatus.granted || _permissionGranted == null) {
  //     print('_requestPermission : ${_permissionGranted}');
  //     final PermissionStatus permissionRequestedResult = await location.requestPermission();
  //     setState(() {_permissionGranted = permissionRequestedResult;});
  //     print('_requestPermission : ${_permissionGranted}');
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
  //   print('_requestService : ${_serviceEnabled}');
  //   final bool serviceRequestedResult = await location.requestService();
  //   setState(() {_serviceEnabled = serviceRequestedResult;});
  //   print('_requestService : ${_serviceEnabled}');
  // }
  // // ตรวจจับ Location ครั้งเดียว
  // Future<void> _getLocation() async {
  //   setState(() {
  //     _error = null;
  //     _loading = true;
  //   });
  //   try {
  //     final LocationData _locationResult = await location.getLocation();
  //     setState(() {
  //       _location = _locationResult;
  //       _loading = false;
  //     });
  //   } on PlatformException catch (err) {
  //     setState(() {
  //       _error = err.code;
  //       _loading = false;
  //     });
  //   }
  //
  //   print('_getLocation : ${_loading}');
  // }
  // // ตรวจจับ Location ตลอดเวลา
  // Future<void> _listenLocation() async {
  //   _locationSubscription = location.onLocationChanged.handleError((dynamic err) {
  //     if (err is PlatformException) {
  //       setState(() {
  //         _error = err.code;
  //       });
  //     }
  //       _locationSubscription?.cancel();
  //     setState(() {
  //       _locationSubscription = null;
  //     });
  //   }).listen((LocationData currentLocation) {
  //     setState(() {
  //       _error = null;
  //       _location = currentLocation;
  //     });
  //   });
  //   setState(() { });
  //   print('_listenLocation : ${_location}');
  // }
  // // หยุดตรวจจับ Location
  // Future<void> _stopListen() async {
  //   _locationSubscription?.cancel();
  //   setState(() {
  //     _locationSubscription = null;
  //   });
  // }

  Future _getLocationAll() async {
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
      });
    } catch (e) {
      return _location = null;
    }
    return _location;
  }
  /// Location End

  /// Google Maps Start
  // แผนที่ google maps
  Widget getGmap(LocationData latlng) {
    return GoogleMap(
      markers: _markers,
      mapType: _mapType,
      myLocationEnabled: checkBox_myLocation,
      myLocationButtonEnabled: checkBox_myLocation,
      trafficEnabled: checkBox_traffic,

      initialCameraPosition: CameraPosition(
        target: LatLng(latlng.latitude,latlng.longitude),//LatLng(13.7650836, 100.5379664),
        zoom: 15,
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

      // _markers.add(Marker(
      //   markerId: MarkerId(LatLng(13.9272683,100.5330269).toString()),
      //   position: LatLng(13.9272683,100.5330269),
      //   infoWindow: InfoWindow(
      //     title: 'I am a marker',
      //   ),
      //   icon: _markerIcon,
      // ));

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
    await _getLocationAll();
    final GoogleMapController controller = await _controller.future;
    //currentLocation = await _listenLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_location.latitude,_location.longitude),
          //LatLng(13.9272683,100.5330269), //Bis Group
          zoom: 15,
        )));

    // setState(() {
    //   _markers.clear();
    //   _markers.add(Marker(
    //     markerId: MarkerId(LatLng(_location.latitude,_location.longitude).toString()),
    //     position: LatLng(_location.latitude,_location.longitude),
    //     infoWindow: InfoWindow(
    //       title: 'I am a marker',
    //     ),
    //     icon: _markerIcon,
    //   ));
    // });

  }
  // สร้าง Marker icon ด้วยรูปภาพ
  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context, size: Size.square(48));
      BitmapDescriptor.fromAssetImage(
          imageConfiguration, 'my_location.png')
          .then(_updateBitmap);
    }
  }
  // กำหนด ค่า icon ใส่ parameter
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
