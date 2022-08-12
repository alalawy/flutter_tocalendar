import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultAreaBg extends StatelessWidget {
  DefaultAreaBg(
      {Key? key,
      this.color = Colors.amber,
      this.bottomColor = Colors.blue,
      this.emoticon})
      : super(key: key);
  Color? color;
  Color? bottomColor;
  String? emoticon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(color: color!, shape: BoxShape.circle),
            height: 22,
            width: 22,
          ),
        ),
        SizedBox(
          width: 35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$emoticon',
                style: const TextStyle(fontSize: 10),
              ),
              Container(
                decoration:
                    BoxDecoration(color: bottomColor!, shape: BoxShape.circle),
                width: 4,
                height: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
