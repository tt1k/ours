import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final Key key;

  TextWidget(this.key);

  @override
  State<StatefulWidget> createState() => TextWidgetState();
}

class TextWidgetState extends State<TextWidget> {

  Timer? timer;

  int year = 0;
  int month = 0;
  int day = 0;
  int hour = 0;
  int minute = 0;
  int second = 0;
  DateTime startDate = DateTime(2018, 11, 3, 0, 0);

  timeChange() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      Duration difference = DateTime.now().difference(startDate);
      year = (difference.inDays / 365).floor();
      month = ((difference.inDays % 365) / 30).floor();
      day = difference.inDays - year * 365 - month * 30;
      hour = difference.inHours % 24;
      minute = difference.inMinutes % 60;
      second = difference.inSeconds % 60;
      setState(() {});
    });
  }

  @override
  void initState() {
    timeChange();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String monthStr = month < 10 ? "0" + month.toString() : month.toString();
    String dayStr = day < 10 ? "0" + day.toString() : day.toString();
    String hourStr = hour < 10 ? "0" + hour.toString() : hour.toString();
    String minuteStr = minute < 10 ? "0" + minute.toString() : minute.toString();
    String secondStr = second < 10 ? "0" + second.toString() : second.toString();
    String str = year.toString() + "年" + monthStr + "月" + dayStr + "天" + hourStr + "时" + minuteStr + "分" + secondStr + "秒";

    return Text(str, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'oursFont', height: 1.6), textAlign: TextAlign.center);
  }
}