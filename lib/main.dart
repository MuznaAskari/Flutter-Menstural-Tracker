import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'GynaikaAppBar.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/mensturalCycle',
    routes: {
      '/mensturalCycle' : (context) => mensturalCycle()
    },
  ));
}


final _formkey = GlobalKey<FormState>();
class mensturalCycle extends StatefulWidget {
  const mensturalCycle({Key? key}) : super(key: key);
  get periodDays  {
    List<DateTime> toHighlight = [];
    for (int i = 0; i <= selectedDate.end.difference(selectedDate.start).inDays; i++) {
      toHighlight.add(selectedDate.start.add(Duration(days: i)));
    }
    return toHighlight;
  }
  @override
  State<mensturalCycle> createState() => _mensturalCycleState();
}

DateTimeRange selectedDate = DateTimeRange(
  start: DateTime.now(),
  end:  DateTime.now(),
);

class _mensturalCycleState extends State<mensturalCycle> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GynaikaAppbar(),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5, width: 5,),
            Image.asset('assets/period(3).jpg', width: 700,height: 400,),
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.pink[900], //<-- SEE HERE
                ),
                onPressed: () async{
                  final DateTimeRange? newDateRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(3000),
                      builder: (context, child) => Theme(
                        data: ThemeData().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.pink[900]!,
                            onPrimary: Colors.white,
                            onSurface: Colors.pink[900]!,
                          ),
                        ),
                        child: child!,
                      )
                  );
                  if (newDateRange != null){
                    setState(() {
                      selectedDate = newDateRange;
                      print(newDateRange);
                    });
                  }
                },
                child: Text(
                  'Choose your period dates',
                )
            ),
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                  defaultBuilder:(context, day, focusedDay) {
                    for (DateTime d in widget.periodDays) {
                      if (day.day == d.day &&
                          day.month == d.month &&
                          day.year == d.year) {
                        return Container(
                          decoration:  BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    }
                    if ((day.day == selectedDate.start.day-1 || day.day == selectedDate.start.day-2) &&
                        day.month == selectedDate.start.month &&
                        day.year == selectedDate.start.year){
                      return Container(
                        decoration: BoxDecoration(
                          // color: Colors.orange[50],
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }
                    if ((day.day == selectedDate.end.day+1 || day.day == selectedDate.end.day+2) &&
                        day.month == selectedDate.start.month &&
                        day.year == selectedDate.start.year){
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }
                    if ((day.day == selectedDate.end.day+4 || day.day == selectedDate.end.day+5 || day.day == selectedDate.end.day+6 || day.day == selectedDate.end.day+7) &&
                        day.month == selectedDate.start.month &&
                        day.year == selectedDate.start.year){
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }
                    if ((day.day == selectedDate.start.day) &&
                        day.month == selectedDate.start.month+1 &&
                        day.year == selectedDate.start.year){
                      return Container(
                        decoration: BoxDecoration(
                          // color: Colors.orange[50],
                          border: Border.all(color: Colors.red[600]!),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 5, width: 5,),
                  Text(
                    'Pre period',
                    style: TextStyle(
                        fontFamily: 'Raleway'
                    ),
                  ),
                  SizedBox(height: 10, width: 10,),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 5, width: 5,),
                  Text(
                    'Period',
                    style: TextStyle(
                        fontFamily: 'Raleway'
                    ),
                  ),
                  SizedBox(height: 10, width: 10,),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 5, width: 5,),
                  Text(
                    'Post period',
                    style: TextStyle(
                        fontFamily: 'Raleway'
                    ),
                  ),
                  SizedBox(height: 10, width: 10,),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 5, width: 5,),
                  Text(
                    'Ovalution',
                    style: TextStyle(
                        fontFamily: 'Raleway'
                    ),
                  ),

                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
