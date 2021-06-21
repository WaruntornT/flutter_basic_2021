import 'package:flutter/material.dart';

// package เช็คว่าหน้าจอที่แสดเป็น Mobile Tablet DeskTop
// https://pub.dev/packages/responsive_builder
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable Full Screen'),
      ),
      body: ScreenTypeLayout(
        desktop: Text('Screen Layout Desktop'),
        tablet: Text('Screen Layout Tablet'),
        mobile: Text('Screen Layout Mobile'),
      ),
    );
  }
}