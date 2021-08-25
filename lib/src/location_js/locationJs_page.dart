import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:html';

import 'dart:js';
import 'dart:io';
import 'package:js/js.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_basic_2021/src/location_js/locationJs.dart';

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:js/js.dart';

class LocationJsPage extends StatefulWidget {
  const LocationJsPage({Key key}) : super(key: key);

  @override
  _LocationJsPageState createState() => _LocationJsPageState();
}

class _LocationJsPageState extends State<LocationJsPage> {

  double _latitude = 0.0;
  double _longitude = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021 : _Location Js'),
        ),
        body: Center(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  // getCurrentPosition(allowInterop((pos) {
                  //       print(pos.coords.latitude);
                  //       print(pos.coords.longitude);
                  //   setState(() {
                  //     _latitude = pos.coords.latitude;
                  //     _longitude = pos.coords.longitude;
                  //   });
                  // }));

                  // _getCurrentLocation() {
                  //   if (kIsWeb) {
                     getCurrentPosition(allowInterop((pos) => success(pos)));
                  //   }
                  // }

                },
                child: const Text('Mozilla GeoLocation'),
              ),
              Text('LAT : ${_latitude}'),
              Text('LONG : ${_longitude}'),
            ],
          ),
        ),
    );
  }


  success(pos) {
    // try {
      print(pos.coords.latitude);
      print(pos.coords.longitude);
      // _latitude = double.parse( pos.coords.latitude);
      // _longitude = double.parse( pos.coords.longitude);
      _latitude = pos.coords.latitude;
      _longitude = pos.coords.longitude;

      setState(() {

      });

    // } catch (ex) {
    //   print("Exception thrown : " + ex.toString());
    // }
  }
}
