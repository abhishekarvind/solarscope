import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/energy_production_page_graph.dart';
import 'package:solarscope/utils/colors.dart';
import 'package:solarscope/utils/textstyles.dart';

import '../utils/responsive.dart';


class EnergyProuction extends StatefulWidget {
  const EnergyProuction({super.key});

  @override
  State<EnergyProuction> createState() => _EnergyProuctionState();
}

class _EnergyProuctionState extends State<EnergyProuction> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context)/30,horizontal: AppMediaQuery.screenWidth(context)/30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextStyles.head("Energy Production", 24.0),
                CustomTextStyles.subtext("Select the month and get the energy\nproduction value", 14.0, TextAlign.start),
                SizedBox(height: AppMediaQuery.screenHeight(context)/30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 2),
                      itemCount: months.length,
                      itemBuilder: (context,index){
                      return SizedBox(
                        width: AppMediaQuery.screenWidth(context)/2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              PersistentNavBarNavigator.pushNewScreen(context, screen:EnergyProductionGraph(value: months[index]));
                            },
                            child: Card(
                              elevation: 0,
                              color: index%2!=0?CustomColor.lightorange():CustomColor.orange(),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomTextStyles.subtext(months[index], 14.0, TextAlign.end),
                                )
                              ),
                            ),
                          ),
                        ),
                      );

                      }
                  ),
                ),

              ],

            ),
          ),
        ),
      ),

    );
  }
}
