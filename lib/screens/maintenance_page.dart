import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';
import '../utils/textstyles.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  String solarMaintenanceInfo = """
After proper installation, maintaining a solar energy system is straightforward, requiring minimal attention. A well-designed solar system can endure for over 15 years, backed by a 25-year performance warranty for solar panels. With appropriate care, you can ensure consistent and optimized energy output over an extended period.
""";
  List<String> maintenanceChecklist = [
    "Review daily stats for system health.",
    "Inspect panels for cleanliness and damage, secure cabling.",
    "Ensure cables are secure, with voltages within tolerance.",
    "Confirm mounting hardware is in good condition, maintain earth connection.",
    "Check for water, ensure seals and connections are intact.",
    "Inspect breakers for damage, confirm isolation device functionality.",
    "Check for water damage on fuse boxes and resistive joints.",
    "Inspect for damage, resistive joints, and confirm DC voltage."
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppMediaQuery.screenHeight(context) / 80,
                horizontal: AppMediaQuery.screenWidth(context) / 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMediaQuery.screenHeight(context) / 60,
                      horizontal: AppMediaQuery.screenWidth(context) / 30),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/backlogo.png",
                            height: AppMediaQuery.screenHeight(context) / 3.5,
                          )),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Maintenance\n",
                                style: TextStyle(
                                    fontSize: AppMediaQuery.textFactor(context) * 36,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Tips",
                                style: TextStyle(
                                    fontSize: AppMediaQuery.textFactor(context) * 36,
                                    color: CustomColor.orange(),
                                    fontWeight: FontWeight.bold)),
                          ])),
                    ],
                  ),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomTextStyles.subtext(solarMaintenanceInfo,
                    AppMediaQuery.textFactor(context) * 16, TextAlign.start),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                ListTile(
                  leading: Image.asset('assets/icon1.png'),
                  title:CustomTextStyles.subtext("Keep panels clean",
                      AppMediaQuery.textFactor(context) * 16, TextAlign.start),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                ListTile(
                  leading: Image.asset('assets/icon2.png'),
                  title:CustomTextStyles.subtext("Trim trees",
                      AppMediaQuery.textFactor(context) * 16, TextAlign.start),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                ListTile(
                  leading: Image.asset('assets/icon3.png'),
                  title:CustomTextStyles.subtext("Check performance",
                      AppMediaQuery.textFactor(context) * 16, TextAlign.start),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 30,),
                CustomTextStyles.head("Solar System Health\nChecklist",
                    AppMediaQuery.textFactor(context) * 24),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 30,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemCount: maintenanceChecklist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset("assets/tools.png", height: 46,),
                          title: CustomTextStyles.subtext(maintenanceChecklist[index],
                              AppMediaQuery.textFactor(context) * 16, TextAlign.start),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 20,),
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
