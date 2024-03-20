import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class TimeWiseData {
  final String month;
  final String time;
  final double voltage;
  final double current;
  final double power;
  final double voc;
  final double isc;
  final double generated;

  TimeWiseData({
    required this.month,
    required this.time,
    required this.voltage,
    required this.current,
    required this.power,
    required this.voc,
    required this.isc,
    required this.generated,
  });
}

Future<List<TimeWiseData>> loadTimeWiseData() async {
  List<TimeWiseData> data = [];

  final String csvString = await rootBundle.loadString('assets/livedata.csv');
  final List<List<dynamic>> fields = const CsvToListConverter().convert(csvString);

  for (var row in fields) {
    final month = row[0].toString();
    final time = row[1].toString();
    final voltage = double.parse(row[2].toString());
    final current = double.parse(row[3].toString());
    final power = double.parse(row[4].toString());
    final voc = double.parse(row[5].toString());
    final isc = double.parse(row[6].toString());
    final generated = double.parse(row[7].toString());

    final timeWiseData = TimeWiseData(
      month: month,
      time: time,
      voltage: voltage,
      current: current,
      power: power,
      voc: voc,
      isc: isc,
      generated: generated,
    );

    data.add(timeWiseData);
  }


  return data;
}




