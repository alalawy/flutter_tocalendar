import 'package:flutter/material.dart';
import 'package:flutter_tocalendar/flutter_tocalendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? year;
  int? month;

  @override
  void initState() {
    year = DateTime.now().year;
    month = DateTime.now().month;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 300,
          child: Column(
            children: [
              ToCalendarWidget(
                customArea: [
                  CustomArea(
                      date: DateTime(2022, 08, 12),
                      child: DefaultAreaBg(
                        emoticon: '🎉',
                      ),
                      onPressed: () => print("Birthday")),
                  CustomArea(
                      date: DateTime(2022, 08, 17),
                      child: Container(
                        color: Colors.red,
                      ),
                      onPressed: () => print("Birthday")),
                  CustomArea(
                      date: DateTime(2022, 08, 1),
                      child: Container(
                        color: Colors.green,
                      ),
                      onPressed: () => print("Aku Makan")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
