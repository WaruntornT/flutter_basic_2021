import 'package:flutter/material.dart';
import 'package:flutter_basic_2021/src/Geolocator.dart';
import 'package:flutter_basic_2021/src/checkPlatform.dart';

// Check Screen Layout
import 'package:flutter_basic_2021/src/home.dart';

// Google Maps
import 'package:flutter_basic_2021/src/gmap.dart';
import 'package:flutter_basic_2021/src/location_bis_code/locationbiscode.dart';
import 'package:flutter_basic_2021/src/location_bis_code_test/locationbiscodetest.dart';
import 'package:flutter_basic_2021/src/location_js/locationJs_page.dart';
import 'package:flutter_basic_2021/src/showdatetimepicker.dart';
import 'package:flutter_basic_2021/src/shownumberpicker.dart';

import 'package:flutter_basic_2021/src/testmappage.dart';

// Location
import 'package:flutter_basic_2021/src/location.dart';

import 'package:flutter_basic_2021/src/appsetting.dart';
import 'package:flutter_basic_2021/src/permissionhandler.dart';

import 'package:flutter_basic_2021/src/newPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// final Map<String,WidgetBuilder> map = {
//   '/home':(BuildContext context)=>Home(),
// };
// String initialRoute = '/home';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   routes: map,
    //   initialRoute: initialRoute,
    // );
    return MaterialApp(
      //title: 'Flutter Basic 2021',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Report1(),
      home: MyHomePageDetail(),
    );
  }
}

class MyHomePageDetail extends StatefulWidget {
  @override
  _MyHomePageDetailState createState() => _MyHomePageDetailState();
}

class _MyHomePageDetailState extends State<MyHomePageDetail> {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic 2021',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      // home: Report1(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Location BIS Code'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationBisCode()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Location Code ที่ใช้ใน Smart Sales BIS Web & App" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///LocationBisCode
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Location BIS Code (Location Package)'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationBisCodeTest()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Location Code ที่ใช้ใน Smart Sales BIS Web & App : (Location Package)" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///LocationBisCode Location Package
                  ///
                  SizedBox(
                    height: 50,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Check Screen Layout'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text("Package เช็คว่าหน้าจอที่แสดเป็น Mobile Tablet DeskTop" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Google Maps & Location'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gmap()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Google Maps Flutter & Location " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Test '),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TestMapPage()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" แสดงแผนที่พร้อมร้องขอตำแหน่ง Location" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Location'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Location()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Location Package" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///Location Package
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Geolocator'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GeolocatorEx()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Geolocator Package : " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///Geolocator
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Flutter Web Location JS '),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PermissionHandler()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Get Location By JS (Support Flutter Web)" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), /// Location JS
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : App Setting'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AppSetting()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" App Setting Package : เปิดหน้าการตั้งค่า ต่าง ๆ ในแอพ" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///App Setting
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Permission Handler '),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PermissionHandler()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" permission_handler Package : เช็คสิทธิและการจัดการต่าง ๆ ตัวอย่าง Location (Android)" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///Permission Handler

                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Check Platform'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CheckPlatform()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text("ตรวจสอบ Device ว่าใช้ Platform Android,iOS,Web เป็นต้น" , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///Check Platform
                  ///
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : Flutter JS EX: Location'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationJsPage()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Flutter JS EX: Location " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///Flutter JS EX: Location
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : showDateTimePicker & showTimePicker'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowDatetimePicker()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" showDateTimePicker & showTimePicker " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), ///showDateTimePicker & showTimePicker
                  ///
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : ShowNumberPicker'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShowNumberPicker()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" Show Number Picker " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), /// ShowNumberPicker
                  ///
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Example : NewPage'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NewPage()),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: new Text(" ... " , textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}