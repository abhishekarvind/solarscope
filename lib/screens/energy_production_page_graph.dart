import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/energy_produced_time.dart';
import 'package:solarscope/utils/bar_data.dart';
import 'package:solarscope/utils/button.dart';
import 'package:solarscope/utils/colors.dart';
import '../utils/responsive.dart';
import '../utils/solar_facts_2.dart';
import '../utils/textstyles.dart';


class EnergyProductionGraph extends StatefulWidget {
  final String value;
  const EnergyProductionGraph({super.key, required this.value});

  @override
  State<EnergyProductionGraph> createState() => _EnergyProductionGraphState();
}

class _EnergyProductionGraphState extends State<EnergyProductionGraph> {
  late List<int> data;
   List<int> time =[6,7,8,9,10,11,12,1,2,3,4,5,6];

  @override
  void initState() {
    super.initState();
    data = CustomBarData.getDataForMonth(widget.value);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context)/30,horizontal: AppMediaQuery.screenWidth(context)/30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                CustomTextStyles.head("Energy Production", 24.0),
                CustomTextStyles.subtext("Average irradiance of the month", 14.0, TextAlign.start),
                SizedBox(height: AppMediaQuery.screenHeight(context)/30,),
                AspectRatio(aspectRatio: 2,
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      show: false
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barsSpace: 8,
                        barRods: data.map((value) {
                          return BarChartRodData(width: 20,
                            borderRadius: BorderRadius.circular(3),
                            color: value.isEven?CustomColor.lightorange():CustomColor.orange(), toY: value.toDouble(),

                          );
                        }).toList(),
                      ),
                    ],


                  )
                ),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context)/30,),
                Center(
                  child: CustomTextStyles.subtext("From 6AM to 6PM", 16.0, TextAlign.start),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context)/30,),

                SizedBox(height: AppMediaQuery.screenHeight(context)/40,),
                CustomButton.button("Hourly Value", CustomColor.orange(), Colors.black, () {
                  PersistentNavBarNavigator.pushNewScreen(context, screen: EnergyProducedByTime(month: widget.value,),
                    pageTransitionAnimation: PageTransitionAnimation.fade
                  );
                }),
                SizedBox(height: AppMediaQuery.screenHeight(context)/40,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
