import 'dart:html';
import 'package:flutter/material.dart';

// Check Screen Layout
import 'package:flutter_basic_2021/src/home.dart';

import 'package:flutter_basic_2021/src/newPage.dart';

// final Map<String,WidgetBuilder> map = {
//   '/home':(BuildContext context)=>Home(),
// };
//
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