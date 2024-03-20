import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/maintenance_page.dart';
import 'package:solarscope/screens/scheme_page.dart';
import 'package:solarscope/utils/textstyles.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';

class CareHub extends StatefulWidget {
  const CareHub({super.key});

  @override
  State<CareHub> createState() => _CareHubState();
}

class _CareHubState extends State<CareHub> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppMediaQuery.screenHeight(context) / 30,
              horizontal: AppMediaQuery.screenWidth(context) / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Care",
                        style: TextStyle(
                            fontSize: AppMediaQuery.textFactor(context) * 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "Hub",
                        style: TextStyle(
                            fontSize: AppMediaQuery.textFactor(context) * 35,
                            color: CustomColor.orange(),
                            fontWeight: FontWeight.bold)),
                  ])),
              SizedBox(height: AppMediaQuery.screenHeight(context)/20,),
              Card(
                color: CustomColor.lightorange(),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMediaQuery.screenHeight(context) / 40,
                      horizontal: AppMediaQuery.screenWidth(context) / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextStyles.head("PMSuryaGhar",
                          AppMediaQuery.textFactor(context) * 14),
                      CustomTextStyles.subtext(
                          "Get to know about the subside scheme",
                          AppMediaQuery.textFactor(context) * 12,
                          TextAlign.start),
                      SizedBox(height: 10,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          ElevatedButton(

                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(context, screen: SchemePage(),
                                  pageTransitionAnimation: PageTransitionAnimation.fade
                              );
                            }, child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Open",
                              style: TextStyle(
                                  color: CustomColor.orange(),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))
                            ),
                          )
                        ],
                      )
                    ],

                  ),
                ),
              ),
              Card(
                color: CustomColor.lightorange(),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMediaQuery.screenHeight(context) / 40,
                      horizontal: AppMediaQuery.screenWidth(context) / 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextStyles.head("Maintenance Tips",
                          AppMediaQuery.textFactor(context) * 14),
                      CustomTextStyles.subtext(
                          "Learn practical maintenance tips to keep your system running efficiently.",
                          AppMediaQuery.textFactor(context) * 12,
                          TextAlign.start),
                      SizedBox(height: 10,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          ElevatedButton(

                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(context, screen: MaintenancePage(),
                                pageTransitionAnimation: PageTransitionAnimation.fade
                            );}, child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Open",
                              style: TextStyle(
                                  color: CustomColor.orange(),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))
                            ),
                          )
                        ],
                      )
                    ],

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
