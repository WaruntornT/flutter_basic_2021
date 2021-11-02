import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb; /// Web = true ,Android & iOS = false
import 'package:location/location.dart';

class LocationBisCodeTestService {

  /// Parameter Start
  final Location location = Location();
  /// Parameter End

  /// START Function Location
  // เช็ค สิทธ์
  Future<PermissionStatus> check_Permission() async {
    final PermissionStatus permissionGrantedResult = await location.hasPermission();
    print("check_Permission: ${permissionGrantedResult}");
    //setState(() {_permissionGranted = permissionGrantedResult;});
    return permissionGrantedResult;
  }
  // ร้องขอ สิทธ์
  Future<PermissionStatus> request_Permission() async {
      final PermissionStatus permissionRequestedResult = await location.requestPermission();
      //setState(() {_permissionGranted = permissionRequestedResult;});
      print('request_Permission : ${permissionRequestedResult}');
      return permissionRequestedResult;
  }
  // เช็ค การเปิด Location Service
  Future<bool> check_Service() async {
    final bool serviceEnabledResult = await location.serviceEnabled();
    //setState(() { _serviceEnabled = serviceEnabledResult;});
    print('check_Service : ${serviceEnabledResult}');
    return serviceEnabledResult;
  }
  // ร้องขอ การเปิด Location Service
  Future<bool> request_Service() async {
    final bool serviceRequestedResult = await location.requestService();
    //setState(() {_serviceEnabled = serviceRequestedResult;});
    print('request_Service : ${serviceRequestedResult}');
    return serviceRequestedResult;
  }
  // ตรวจจับ Location ครั้งเดียว
  Future<LocationData> get_Location() async {
    // try {
    //   //
    // } on PlatformException catch (err) {
    //   //
    // }
    final LocationData locationResult = await location.getLocation();
    print('get_Location : ${locationResult}');
    return locationResult;
  }
  /// END Function Location

  /// START showDialog
  // แสดงกล่องข้อความ กรณี ปิด location
  void showAlertRequestPermissionLocation(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
              children:[
                Flexible(flex: 1,child: Image.asset('assets/new-bisgroup-logo.png',width: 100, height: 80, fit: BoxFit.contain,)),
                // Image.network('https://flutter-examples.com/wp-content/uploads/2019/12/android_icon.png',
                //   width: 50, height: 50, fit: BoxFit.contain,),
                Flexible(flex: 3,child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 0,right: 0,bottom: 0),
                  child: Text('Allow "SmartSaleBIS" to access your location even when you are not using the App?'),
                ))
              ]
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Text('     SmartSaleBIS needs access to your location. For use in recording visits, Check In and Google Map.\n'
                  '     Please "Allow" access to your location. For your benefit of making SmartSaleBIS work perfectly.\n'
                  '     If you don\'t want to share a map of your location. Your can choose Don\'t Allow.'),
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Don\'t Allow" , style: TextStyle(fontWeight: FontWeight.normal,fontStyle: FontStyle.italic ,color: Colors.grey) ),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Allow" , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueAccent) ),
              onPressed: () async {
                // permission = await request_Permission();
                // //permission = await request_Permission_deniedForever();
                // if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
                //   //
                //   if(permission == LocationPermission.deniedForever){
                //     Navigator.of(context).pop();
                //     showAlertRequestPermissionLocationIFdeniedForever(context);
                //   }
                // }else{
                //   Navigator.of(context).pop();
                // }
              },
            ),
          ],
        )
    );
  }
  // แสดงกล่องข้อความ กรณี ปิด location ถาวร (Android)
  void showAlertRequestPermissionLocationIFdeniedForever(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
              children:[
                Flexible(flex: 1,child: Image.asset('assets/new-bisgroup-logo.png',width: 100, height: 80, fit: BoxFit.contain,)),
                // Image.network('https://flutter-examples.com/wp-content/uploads/2019/12/android_icon.png',
                //   width: 50, height: 50, fit: BoxFit.contain,),
                Flexible(flex: 3,child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 0,right: 0,bottom: 0),
                  child: Text('Allow "SmartSaleBIS" to access your location even when you are not using the App?'),
                ))
              ]
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Text('     SmartSaleBIS needs access to your location. For use in recording visits, Check In and Google Map.\n'
                  '     You have permanently disabled access to your location!. Please Click "Allow to Setting Location".\n'
                  '     If you don\'t want to share a map of your location. Your can choose Don\'t Allow.'),
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Don\'t Allow" , style: TextStyle(fontWeight: FontWeight.normal,fontStyle: FontStyle.italic ,color: Colors.grey) ),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(" Allow to Setting Location " , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueAccent) ),
              onPressed: () async {
                // permission = await request_Permission_deniedForever();
                // if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
                //   //
                // }else{
                //   Navigator.of(context).pop();
                // }
              },
            ),
          ],
        )
    );
  }
  // แสดงกล่องข้อความ กรณี ปิด location ถาวร (Web)
  void showAlertWeb_deniedForever(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
              children:[
                Flexible(flex: 1,child: Image.asset('assets/new-bisgroup-logo.png',width: 100, height: 80, fit: BoxFit.contain,)),
                // Image.network('https://flutter-examples.com/wp-content/uploads/2019/12/android_icon.png',
                //   width: 50, height: 50, fit: BoxFit.contain,),
                Flexible(flex: 3,child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 0,right: 0,bottom: 0),
                  child: Text('Allow "SmartSale BIS" to access your location the Website?'),
                ))
              ]
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Text('You blocked access to your location. Please Unlock and allow access to your location. in order to be able to use the functions perfectly.'),
            ),
          ),
          actions: [
            FlatButton(
              child: Text(" OK " , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.blueAccent) ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }
  /// END showDialog

}
