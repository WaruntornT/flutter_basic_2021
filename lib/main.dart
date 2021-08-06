import 'package:flutter/material.dart';
import 'package:flutter_basic_2021/src/checkPlatform.dart';

// Check Screen Layout
import 'package:flutter_basic_2021/src/home.dart';

// Google Maps
import 'package:flutter_basic_2021/src/gmap.dart';
import 'package:flutter_basic_2021/src/testmappage.dart';

// Location
import 'package:flutter_basic_2021/src/location.dart';

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
        body: Center(
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
                ),
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
                ),
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
    );
  }
}