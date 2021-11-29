///
import 'dart:ui';
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewSingleChildScrollView extends StatefulWidget {
  const NewSingleChildScrollView({Key key}) : super(key: key);

  @override
  _NewSingleChildScrollViewState createState() => _NewSingleChildScrollViewState();
}

class _NewSingleChildScrollViewState extends State<NewSingleChildScrollView> {

  ///
  ///
  /// Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };

  /// ScrollBehavior can be set for a specific widget.
  final ScrollController controller = ScrollController();
  ///
  ///
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scroll Flutter ^2.5'),
        ),
        body:
        ///
        ///
        ///
        /// Scroll Config Flutter ^2.5
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child:
          /// scroll up down
          SingleChildScrollView(
            /// scroll left right
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                DataTable(
                  showBottomBorder: true,
                  columnSpacing: 25,
                  sortColumnIndex: 0,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'ลำดับ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'รหัสสินค้า',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'รายการ',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'จำนวน',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'หน่วย',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'ราคา / หน่วย',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'ส่วนลด',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text(
                        'จำนวนเงิน',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(cells: [
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('No Data')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                      DataCell(Text('No Data')),
                    ]),
                  ],
                ),
              ),
          ),
        )
        ///
        ///
        ///

    );
  }
}
