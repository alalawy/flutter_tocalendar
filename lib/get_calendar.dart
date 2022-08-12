import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tocalendar/helper.dart';
import 'package:flutter_tocalendar/widgets/custom_area.dart';
import 'package:flutter_tocalendar/widgets/date_area.dart';

class ToCalendarWidget extends StatefulWidget {
  ToCalendarWidget({Key? key, this.customArea, this.defaultOnPressed})
      : super(key: key);

  List<CustomArea>? customArea;
  VoidCallback? defaultOnPressed;

  @override
  State<ToCalendarWidget> createState() => _ToCalendarWidgetState();
}

class _ToCalendarWidgetState extends State<ToCalendarWidget> {
  List<dynamic>? dateArr;
  int? month;
  int? year;

  @override
  void initState() {
    year = DateTime.now().year;
    month = DateTime.now().month;

    if (widget.defaultOnPressed == null) {
      widget.defaultOnPressed = () {};
    }

    dateArr = Helper(year: year, month: month).getCal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calData(),
    );
  }

  List<Row> calData() {
    List<Row> _dataColumn = [
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                Text(Helper().parseMonth(month!)),
                Text(year.toString())
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => setState(() {
                        if (month == 1) {
                          month = 13;
                          year = year! - 1;
                        }
                        month = month! - 1;
                        dateArr = Helper(year: year, month: month).getCal();
                      }),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () => setState(() {
                        if (month == 12) {
                          month = 0;
                          year = year! + 1;
                        }
                        month = month! + 1;
                        dateArr = Helper(year: year, month: month).getCal();
                      }),
                  icon: const Icon(Icons.add))
            ],
          ),
        ],
      ),
      Row(
        children: [
          DateArea(
            child: const Text('MIN'),
          ),
          DateArea(
            child: const Text('SEN'),
          ),
          DateArea(
            child: const Text('SEL'),
          ),
          DateArea(
            child: const Text('RAB'),
          ),
          DateArea(
            child: const Text('KAM'),
          ),
          DateArea(
            child: const Text('JUM'),
          ),
          DateArea(
            child: const Text('SAB'),
          ),
        ],
      )
    ];
    for (var element in dateArr!) {
      List<Widget> _dataRow = [];
      for (var element1 in element) {
        var _dataArea;
        if (widget.customArea != null) {
          //print(customArea!.first.date);
          _dataArea = widget.customArea!
              .where((elementArea) => elementArea.date! == element1);
        }
        _dataRow.add(DateArea(
          childBack: _dataArea.isNotEmpty ? _dataArea.first.child : Container(),
          child: TextButton(
            onPressed: _dataArea.isNotEmpty
                ? _dataArea.first.onPressed
                : widget.defaultOnPressed,
            child: Text(
              element1.day.toString(),
              style: TextStyle(
                  color: element1.day == element.first.day ||
                          element1.day == element.last.day
                      ? Colors.red
                      : Colors.black),
            ),
          ),
        ));
      }
      _dataColumn.add(Row(
        children: _dataRow.toList(),
      ));
    }
    return _dataColumn;
  }
}
