import 'package:flutter/material.dart';

class CustomArea {
  VoidCallback? onPressed;
  Widget? child;
  DateTime? date;
  CustomArea({this.onPressed, this.child, required this.date});
}
