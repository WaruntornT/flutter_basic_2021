import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart' as lo; // GPS Location



class Location extends StatefulWidget {
  const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021'),
        ),
        body:
        Column(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Permission status: ${_permissionGranted ?? "unknown"}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 42),
                        child: ElevatedButton(
                          child: const Text('Check'),
                          onPressed: _checkPermissions,
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Request'),
                        onPressed: _permissionGranted == lo.PermissionStatus.granted
                            ? null
                            : _requestPermission,
                      )
                    ],
                  )
                ],
              ), /// Check Permission - ตรวจสอบ การอนุญาติเข้าถึง Location
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Service enabled: ${_serviceEnabled ?? "unknown"}',
                      style: Theme.of(context).textTheme.bodyText1),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 42),
                        child: ElevatedButton(
                          child: const Text('Check'),
                          onPressed: _checkService,
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Request'),
                        onPressed: _serviceEnabled == true ? null : _requestService,
                      )
                    ],
                  )
                ],
              ), /// Check Service - ตรวจสอบ อุปกรณ์ว่าเปิด Location อยู่หรือไม่
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Location: ' + (_error ?? '${_location ?? "unknown"}'),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        child: _loading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text('Get'),
                        onPressed: _getLocation,
                      )
                    ],
                  ),
                ],
              ), /// Listen Location จับ Location ครั้งเดียว
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Listen location: ' + (_error ?? '${_location ?? "unknown"}'),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 42),
                        child: ElevatedButton(
                          child: const Text('Listen'),
                          onPressed:
                          _locationSubscription == null ? _listenLocation : null,
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Stop'),
                        onPressed: _locationSubscription != null ? _stopListen : null,
                      )
                    ],
                  ),
                ],
              ), /// Listen Location จับ Location ทุก ๆ  5 วินาที
            ],
          ),
        ],
      ),
    );
  }

  /// Parameter Start
  final lo.Location location = lo.Location();
  lo.PermissionStatus _permissionGranted;

  bool _serviceEnabled;
  bool _loading = false;
  lo.LocationData _location;
  String _error;
  StreamSubscription<lo.LocationData> _locationSubscription;
  lo.LocationData currentLocation;
  /// Parameter End

  /// START Function Location
  // เช็ค สิทธ์
  Future<void> _checkPermissions() async {
    final lo.PermissionStatus permissionGrantedResult =
    await location.hasPermission();
    setState(() {_permissionGranted = permissionGrantedResult;});
  }
  // ร้องขอ สิทธ์
  Future<void> _requestPermission() async {
    if (_permissionGranted != lo.PermissionStatus.granted || _permissionGranted == null) {
      print('_requestPermission : ${_permissionGranted}');
      final lo.PermissionStatus permissionRequestedResult = await location.requestPermission();
      setState(() {_permissionGranted = permissionRequestedResult;});
      print('_requestPermission : ${_permissionGranted}');
    }
  }
  // เช็ค การเปิด Location
  Future<void> _checkService() async {
    final bool serviceEnabledResult = await location.serviceEnabled();
    setState(() {
      _serviceEnabled = serviceEnabledResult;
    });
  }
  // ร้องขอ การเปิด Location
  Future<void> _requestService() async {
    if (_serviceEnabled == true) {
      return;
    }
    print('_requestService : ${_serviceEnabled}');
    final bool serviceRequestedResult = await location.requestService();
    setState(() {_serviceEnabled = serviceRequestedResult;});
    print('_requestService : ${_serviceEnabled}');
  }
  // ตรวจจับ Location ครั้งเดียว
  Future<void> _getLocation() async {
    setState(() {
      _error = null;
      _loading = true;
    });
    try {
      final lo.LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        _loading = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
        _loading = false;
      });
    }
  }
  // ตรวจจับ Location ตลอดเวลา
  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((dynamic err) {
      if (err is PlatformException) {
        setState(() {
          _error = err.code;
        });
      }
        _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((lo.LocationData currentLocation) {
      setState(() {
        _error = null;
        _location = currentLocation;
      });
    });
    setState(() { });
    print('_listenLocation : ${_location}');
  }
  // หยุดตรวจจับ Location
  Future<void> _stopListen() async {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }
  /// END Function Location

}
