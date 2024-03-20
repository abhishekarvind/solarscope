import 'package:flutter/material.dart';
import 'package:solarscope/utils/time_wise_data.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';
import '../utils/textstyles.dart';


class EnergyProducedByTime extends StatefulWidget {
  final month;
  const EnergyProducedByTime({super.key, required this.month});

  @override
  State<EnergyProducedByTime> createState() => _EnergyProducedByTimeState();
}

class _EnergyProducedByTimeState extends State<EnergyProducedByTime> {
  List<String> timings=["6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm"];
  String selected="6am";
  List<TimeWiseData> timeWiseDataList = []; // List to hold TimeWiseData objects

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    List<TimeWiseData> data = await loadTimeWiseData();
    setState(() {
      timeWiseDataList = data.where((data) => data.month == widget.month).toList();
    });
  }
  



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context)/30,horizontal: AppMediaQuery.screenWidth(context)/30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextStyles.head("Energy Production", 24.0),
              CustomTextStyles.subtext("Average irradiance of the month", 14.0, TextAlign.start),
              SizedBox(height: AppMediaQuery.screenHeight(context)/20,),
              CustomTextStyles.head("Select Timings", 24.0),
              SizedBox(height: AppMediaQuery.screenHeight(context)/20,),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                physics: PageScrollPhysics(),
                shrinkWrap: true,
                itemCount: timings.length,
                itemBuilder: (context,index){
                    if(index>=0&&index<=5) {
                      return GestureDetector(
                        onTap: (){
                        setState(() {
                          selected=timings[index];
                          print(selected);
                        });
                      },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/sun.png",height: 55,),
                            CustomTextStyles.subtext(timings[index].replaceAll("am", ""), AppMediaQuery.textFactor(context)*18,TextAlign.start)
                          ],
                        ),
                      );
                    }
                    else{
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=timings[index];
                            print(selected);
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/noon.png",height: 65,),
                            CustomTextStyles.subtext(timings[index].replaceAll("pm", "")+" ", AppMediaQuery.textFactor(context)*18,TextAlign.start)
                          ],
                        ),
                      );
                    }

                },

              ),
              SizedBox(height: AppMediaQuery.screenHeight(context)/20,),
              ListView.builder(
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  final timeWiseData = timeWiseDataList.firstWhere((data) => data.time == selected, );
                  if(timeWiseData.month.isNotEmpty){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        doubleCard(timeWiseData.voltage, timeWiseData.current, "Voltage", "Current","V","A"),
                        doubleCard(timeWiseData.voc, timeWiseData.current, "Voc", "Isc","V","A"),
                        singleCard(
                            timeWiseData.generated, "Energy Generated", ""),
                      ],
                    );
                  }
                },
              )








            ],
          ),
        ),
      ),

    ));
  }
  Widget singleCard(double value,String name,String symbol){
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      color: CustomColor.lightorange(),
      child: Container(
        height: AppMediaQuery.screenHeight(context)/6,
        width: AppMediaQuery.screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyles.subtext(value.toString()+symbol, AppMediaQuery.textFactor(context)*22.0,TextAlign.start),
                  CustomTextStyles.head(name, 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget doubleCard(double value1,double value2,String name1,String name2,String symbol1,String symbol2){
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
    ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          child: Card(
            elevation: 0,
            color: CustomColor.orange(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppMediaQuery.screenWidth(context)/30,vertical: AppMediaQuery.screenHeight(context)/100),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\n"),
                        CustomTextStyles.subtext(value1.toString()+symbol1, AppMediaQuery.textFactor(context)*22.0,TextAlign.start),
                        CustomTextStyles.head(name1, 16)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: CustomColor.lightorange(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: AppMediaQuery.screenWidth(context)/2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\n"),
                      CustomTextStyles.subtext(value2.toString()+symbol2, AppMediaQuery.textFactor(context)*22.0,TextAlign.start),
                      CustomTextStyles.head(name2, 16)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }


}
