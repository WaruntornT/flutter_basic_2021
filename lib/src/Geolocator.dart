import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/foundation.dart' show kIsWeb;


class GeolocatorEx extends StatefulWidget {
  const GeolocatorEx({Key key}) : super(key: key);

  @override
  _GeolocatorExState createState() => _GeolocatorExState();
}

class _GeolocatorExState extends State<GeolocatorEx> {

  String _message = '';
  String platForm_Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021 : Geolocator'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(_message),
              ElevatedButton(
                onPressed: _determinePosition,
                child: Text('Check Permission Location'),
              ),
            ],
          ),
        ),
    );
  }

  Future<Position> _determinePosition() async {

    _message = "";

    if (kIsWeb){
      platForm_Name = "It's web";
    }else if(Platform.isAndroid) {
      platForm_Name = "it's Android";
    }else if(Platform.isIOS){
      platForm_Name = "it's IOS";
    }else{
      platForm_Name = "NULL";
    }
    print('kIsWeb : ${kIsWeb}');
    _message = _message + "kIsWeb : ${kIsWeb}\n";
    _message = _message + "PlatForm_Name : ${platForm_Name}\n";

    bool serviceEnabled;
    LocationPermission permission;
    Position _Position;

    /// เช็ค Location Service (true,false)
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('serviceEnabled : ${serviceEnabled}');
    _message = _message + "serviceEnabled : ${serviceEnabled}\n";
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      /// ถ้า Platform ไม่ใช่ เว็บ
      if (!kIsWeb){ /// เปิด Location setting
        // await Geolocator.openAppSettings(); /// เปิด การตั้งค่า แอพ
        await Geolocator.openLocationSettings(); /// เปิด Location setting
      }
      setState(() { });
      return Future.error('Location services are disabled.');
    }

    /// เช็ค สิทธ์ Location
    permission = await Geolocator.checkPermission();
    print('permission : ${permission}');
    _message = _message + "permission : ${permission}\n";
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        setState(() { });
        return Future.error('Location permissions are denied');
      }
    }

    /// ถ้า สิทธ์ Location ถูกปิดถาวร
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      /// ถ้า Platform ไม่ใช่ เว็บ
      if (!kIsWeb){ /// เปิด Location setting
        await Geolocator.openAppSettings(); /// เปิด การตั้งค่า แอพ
        // await Geolocator.openLocationSettings(); /// เปิด Location setting
      }

      setState(() { });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    /// ดึง location
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    _Position =  await Geolocator.getCurrentPosition();
    print('_Position : ${_Position}');
    _message = _message + "_Position : ${_Position}\n";
    setState(() { });
    return _Position;

  }

}
