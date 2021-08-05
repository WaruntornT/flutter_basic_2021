import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//package ที่เกี่ยวกับ check platform
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;


class CheckPlatform extends StatefulWidget {
  const CheckPlatform({Key key}) : super(key: key);

  @override
  _CheckPlatformState createState() => _CheckPlatformState();
}

class _CheckPlatformState extends State<CheckPlatform> {
  @override
  Widget build(BuildContext context) {

    String platForm_Name;

    if (kIsWeb){
      platForm_Name = "It's web";
    }else if(Platform.isAndroid) {
      platForm_Name = "it's Android";
    }else if(Platform.isIOS){
      platForm_Name = "it's IOS";
    }else{
      platForm_Name = "NULL";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021 : Check Platform'),
        ),
        body: Text("${platForm_Name}"),
    );
  }
}
