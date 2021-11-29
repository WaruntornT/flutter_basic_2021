import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  // late final ValueNotifier<List<Event>> _selectedEvents;
  ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month; // month twoWeeks week
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _rangeStart;
  DateTime _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));

    print("kFirstDay - kLastDay : ${kFirstDay} - ${kLastDay}");

  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example

    print("kEvents[day] = ${kEvents[day] ?? []}");

    print("kEvents = ${kEvents}");

    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print("_onDaySelected");
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);

      //print(_selectedEvents);
    }
  }

  void _onRangeSelected(DateTime start, DateTime end, DateTime focusedDay) {
    print("_onRangeSelected");
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          // ปฏิทิน
          TableCalendar<Event>(
            firstDay: kFirstDay, // วันที่เริ่มต้นปฏิทิน ex 2021-07-29 00:00:00.000
            lastDay: kLastDay, // วันที่สิ้นสุดปฏิทิน ex 2022-01-29 00:00:00.000
            focusedDay: _focusedDay, // โฟกัสวันที่ปัจจุบัน
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart, // เลือกช่วงวันที่เริ่มต้น
            rangeEndDay: _rangeEnd, // เลือกช่วงวันที่สิ้นสุด
            calendarFormat: _calendarFormat, // รูปแบบการแสดงผล 1.month 2.twoWeeks 3.week 4.values
            rangeSelectionMode: _rangeSelectionMode, // การเลือกช่วงวันที่ // 1.RangeSelectionMode.toggledOff 2.RangeSelectionMode.toggledOn
            eventLoader: //_getEventsForDay, // ฟังก์ชั่น ดึงข้อมูล อีเวนท์
                (day) {
              if (day.weekday == DateTime.monday) {
                return [ Event('Cyclic event'),
                  Event('Event 1'),
                  Event('Event 2'),
                  Event('Event 3'),
                  Event('Event 4'),
                  Event('Event 5'),
                  Event('Event 6'),
                ];
              }

              return [];
            },
            startingDayOfWeek: StartingDayOfWeek.monday, // วันเริ่มต้นของสัปดาห์ 1.monday 2.tuesday 3.wednesday 4.thursday 5.friday 6.saturday 7.sunday

            // Calendar Dates styling
            calendarStyle: const CalendarStyle(
              // Weekend dates color (Sat & Sun Column)
              weekendTextStyle: TextStyle(color: Colors.blueAccent), // ค่าสี วันเสาร์ วันอาทิตย์
              // highlighted color for today
              // todayDecoration: BoxDecoration(
              //   color: Colors.tealAccent,
              //   shape: BoxShape.circle,
              // ),
              // // highlighted color for selected day
              // selectedDecoration: BoxDecoration(
              //   color: Colors.black12,
              //   shape: BoxShape.circle,
              // ),
            ),

            calendarBuilders: // Style Calendar
            CalendarBuilders(

              // style วันที่ เริ่มต้ม
              defaultBuilder: (context, date, focusedDay) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.black87),
                  )),
              // style วันที่ ขณะเลือก
              selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              // style วันที่ ปัจจุบัน
              todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              // markerBuilder : (context, date, events) => Container(
              //     margin: const EdgeInsets.all(4.0),
              //     width: 20,
              //     height: 15,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color: Colors.red,
              //         borderRadius: BorderRadius.circular(10.0)),
              //     child: Text(
              //       date.day.toString(),
              //       style: TextStyle(color: Colors.white),
              //     )),
              markerBuilder : (context, day, events) {
                return events.isNotEmpty ?  _buildEventsMarkerNum(events) : Container();
              },
            ),
            onDaySelected: _onDaySelected, //เลือก วันที่
            onRangeSelected: _onRangeSelected, //เลือก ช่วงวันที่
            onFormatChanged: (format) { // เลือก รูปแบบการแสดงผล 1.month 2.twoWeeks 3.week 4.values
              print("onFormatChanged");
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) { // เลือก เปลี่ยนเดือน < >
              print("onPageChanged");
              _focusedDay = focusedDay;
            },
          ),
          // ปฏิทิน

          const SizedBox(height: 8.0),

          // show event detail
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // show event detail
        ],
      ),
    );
  }

  Widget _buildEventsMarkerNum(List events) {
    print(events.length.toString());
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 3),
        child: Container(
        margin: const EdgeInsets.all(4.0),
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(9.0)),
        child: Text(
          "99",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

}
