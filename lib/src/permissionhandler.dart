import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({Key key}) : super(key: key);

  @override
  _PermissionHandlerState createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021'),
        ),
        body: Text('NewPage'),
    );
  }
}
