import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowDatetimePicker extends StatefulWidget {
  const ShowDatetimePicker({Key key}) : super(key: key);

  @override
  _ShowDatetimePickerState createState() => _ShowDatetimePickerState();
}

class _ShowDatetimePickerState extends State<ShowDatetimePicker> {

  /// Start Parameter
  TimeOfDay _selectedTime;
  TextEditingController txtTest1 = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now())
    //text: ""
  );
  TextEditingController txtTest2 = TextEditingController(
      text: DateFormat('HH:mm').format(DateTime.now())
    //text: ""
  );

  DateTime txtTestDate = DateTime.now();
  TimeOfDay txtTestTime = TimeOfDay.now();
  /// End Parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic 2021 : ShowDatetimePicker ShowTimePicker'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtTest1,
                  onTap: () async {
                    txtTestDate = await showDatePicker(
                      cancelText: '',
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1995),
                      lastDate: DateTime(2030),
                    );

                    setState(() {
                      txtTest1.text = DateFormat('dd/MM/yyyy')
                          .format(txtTestDate ?? DateTime.now());
                    });
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'วันที่ขาย',
                    labelStyle: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: Colors.black, fontSize: 16),
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtTest2,
                  onTap: () async {
                    txtTestTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),// TimeOfDay.now() เวลาปัจจุบัน หรือ กำหนดเวลาที่จะแสดง TimeOfDay(hour: 9,minute: 0),
                      initialEntryMode: TimePickerEntryMode.dial, //dial แสดงนาฬิกา,input กรอกตัวเลข
                      confirmText: "CONFIRM",
                      cancelText: "NOT NOW",
                      helpText: "BOOKING TIME",

                      // 24 ชม.
                      builder: (BuildContext context, Widget child) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                          child: child,
                        );
                      },

                    );

                    DateTime tempDate = DateFormat("HH:mm").parse(
                        txtTestTime.hour.toString() +
                            ":" + txtTestTime.minute.toString());
                    var dateFormat = DateFormat("HH:mm"); // you can change the format here
                    // hh:mm show hours in 12-hour
                    // HH:mm show hours in 24-hour
                    // print(dateFormat.format(tempDate));

                    setState(() {
                      txtTest2.text = (dateFormat.format(tempDate)).toString();
                    });

                  },
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'เวลา',
                    labelStyle: Theme.of(context)
                        .primaryTextTheme
                        .caption
                        .copyWith(color: Colors.black, fontSize: 16),
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

}
