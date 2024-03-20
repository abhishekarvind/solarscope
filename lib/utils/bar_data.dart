import 'package:fl_chart/fl_chart.dart';

class CustomBarData{
  final String month;
  final List<int> data;

  CustomBarData({required this.month, required this.data});
  
  static List<CustomBarData> values =[
    CustomBarData(month: "January", data: [
      20, 50, 250, 420, 490, 520, 580, 630, 530, 420, 320, 220, 10
    ]),
    CustomBarData(month: "February", data:[
      60, 350, 490, 570, 660, 720, 740, 760, 720, 650, 550, 350,40
    ]),
    CustomBarData(month: "March", data:[
      85, 350, 480, 590, 680, 740, 790, 720, 630, 520, 380, 220, 50
    ]),
    CustomBarData(month: "April", data:[
      160, 340, 460, 570, 650, 690, 720, 750, 680, 570, 450, 300, 50
    ]),
    CustomBarData(month: "May", data:[
      90, 220, 340, 450, 530, 560, 520, 470, 390, 340, 280, 290, 190
    ]),
    CustomBarData(month: "June", data: [
      80, 170, 250, 407, 480, 450, 500, 490, 390, 350, 300, 200, 100
    ]),
    CustomBarData(month: "July", data: [
      50, 130, 200, 330, 390, 400, 390, 320, 260, 230, 190, 115, 105
    ]),
    CustomBarData(month: "August", data: [
      50, 150, 290, 350, 450, 490, 480, 430, 370, 300, 280, 190, 55
    ]),
    CustomBarData(month: "September", data: [
      90, 190, 290, 380, 450, 490, 520, 460, 400, 370, 290, 190, 40
    ]),
    CustomBarData(month: "October", data: [
      90, 230, 290, 360, 400, 450, 500, 470, 400, 390, 340, 290, 80
    ]),
    CustomBarData(month: "November", data: [
      80, 290, 300, 360, 400, 460, 480, 430, 390, 380, 290, 225, 40
    ]),
    CustomBarData(month: "December", data: [
      50, 220, 350, 400, 459, 450, 490, 460, 450, 360, 290, 190, 20
    ]),
  ];

  static List<int> getDataForMonth(String month) {
    CustomBarData? barData =
    values.firstWhere((element) => element.month == month, orElse: () => CustomBarData(month: '', data: []));
    return barData.data;
  }
}