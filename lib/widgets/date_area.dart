import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateArea extends StatelessWidget {
  DateArea({Key? key, this.child, this.childBack}) : super(key: key);
  Widget? child;
  Widget? childBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 35,
        height: 35,
        child: Stack(children: [
          childBack ?? Container(),
          Center(
            child: child,
          ),
        ]),
      ),
    );
  }

  // List<Widget> _widget(){

  // }
}
