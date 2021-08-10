import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:app_settings/app_settings.dart';

import 'package:location/location.dart' as loc;

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({Key key}) : super(key: key);

  @override
  _PermissionHandlerState createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021 : Permission Handler'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(_message),
              ElevatedButton(
                onPressed: _checkPermission,
                child: Text('Check Permission Location'),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> _checkPermission() async {
    print('_checkPermission');
    /// START Parameter
    _message = '';
    final loc.Location location = loc.Location();
    /// END Parameter

    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;
    if (!isGpsOn) {
      setState(() {
        _message = _message + "serviceStatus : ${serviceStatus}\nisGpsOn : ${isGpsOn}\nTurn on location services before requesting permission.\n";
      });
      print('Turn on location services before requesting permission.');

      AppSettings.openLocationSettings(); // เปิดหน้า setting location ด้วย package app_setting

      return;
    }

    _message = _message + "serviceStatus : ${serviceStatus}\nisGpsOn : ${isGpsOn}\n";

    final status = await Permission.locationWhenInUse.request(); /// ขอสิทธิเข้าถึง Location
    if (status == PermissionStatus.granted) { /// ขอสิทธิเข้าถึง Location ตอบ ALLOW
      _message = _message + "Permission : ${status}\nPermission granted\n";
      print('Permission granted');

      /// START Get Location
      final loc.LocationData _locationResult = await location.getLocation();
      _message = _message + "Location Result : ${_locationResult}";
      print('Location Result : latitude(${_locationResult.latitude}), longitude(${_locationResult.longitude})');
      /// END Get Location
      ///
    } else if (status == PermissionStatus.denied) { /// ขอสิทธิเข้าถึง Location ตอบ DENY
      _message = _message + "Permission : ${status}\nPermission denied. Show a dialog and again ask for the permission'\n";
      print('Permission denied. Show a dialog and again ask for the permission');
      return;
    } else if (status == PermissionStatus.permanentlyDenied) { /// ถ้าแอพถูก ปิดสิทธิ Location ถาวร จะเปิดหน้าตั้งค่าของแอพนั้น ๆ เพื่อปลดล็อคสิทธิด้วยตัวผู้ใช้เอง
      _message = _message + "Permission : ${status}\nTake the user to the settings page.\n";
      print('Take the user to the settings page.');
      await openAppSettings();
    }


    setState(() {
      _message;
    });
  }

  // ตรวจจับ Location ครั้งเดียว


}
