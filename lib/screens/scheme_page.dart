import 'package:flutter/material.dart';
import 'package:solarscope/utils/button.dart';
import 'package:solarscope/utils/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';

class SchemePage extends StatefulWidget {
  const SchemePage({super.key});

  @override
  State<SchemePage> createState() => _SchemePageState();
}

class _SchemePageState extends State<SchemePage> {
  String solarHouseholdsScheme = """
The Indian government has officially launched the 1 crore solar households scheme announced in the Interim Budget 2024. Named Surya Ghar: Muft Bijli Yojana, the rooftop solar scheme will get a total investment of ₹75,000 crore from the government.

As stated in the budget speech, all beneficiaries will get up to 300 units of free electricity every month. The government will also provide a hiked subsidy under the new scheme.
""";
  List<String> eligibility = [
    "Entire solar projects, from application to installation, must follow the national portal procedures.",
    "Consumers must use empaneled vendors listed on the portal for installation.",
    "Only domestically manufactured solar panels (modules and cells) are allowed.",
    "Strict compliance with all MNRE guidelines and technical specifications is mandatory."
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
                      CustomTextStyles.head("PMSuryaGhar",
                          AppMediaQuery.textFactor(context) * 36)
                    ],
                  ),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomTextStyles.subtext(solarHouseholdsScheme,
                    AppMediaQuery.textFactor(context) * 14, TextAlign.start),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomTextStyles.head("Details",
                    AppMediaQuery.textFactor(context) * 24),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomCard("0-150 units", "1 – 2kW", "₹30,000 to\n₹60,000"),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomCard("150-300 units", "2 – 3kW", "₹60,000 to\n₹78,000"),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                CustomCard(">300 units", "Above 3kW", "₹78,000"),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40,),
                CustomTextStyles.head("Eligibility",
                    AppMediaQuery.textFactor(context) * 24),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemCount: eligibility.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset("assets/points.png", height: 36,),
                          title: CustomTextStyles.subtext(eligibility[index],
                              AppMediaQuery.textFactor(context) * 14, TextAlign.start),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40,),
                CustomTextStyles.head("Steps",
                    AppMediaQuery.textFactor(context) * 24),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      textCard("Online Registration", "Visit www.pmsuryaghar.gov.in to register and submit your subsidy application; third-party involvement is not allowed."),
                      textCard("Feasibility Study", "The DISCOM will conduct a technical feasibility study within 15 days of your application."),
                      textCard("Vendor Installation", "Upon approval, install the system through registered vendors."),
                      textCard("Net Metering Application", "Post-installation, apply for net metering through the portal, and the request will be sent to the DISCOM."),
                      textCard("Plant Inspection", "A plant inspection will be conducted, and if guidelines are met, a commissioning certificate will be issued."),
                      textCard("Bank Details Submission", "Submit your bank details on the portal; subsidy funds will be credited to your account within 30 days."),
                    ],
                    
                  ),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40,),
                CustomButton.button("Apply", CustomColor.orange(), Colors.black, () async {
                  final url =Uri.parse("https://pmsuryaghar.org.in/pm-surya-ghar-yojana-apply-online-process/");
                  launchUrl(url,
                    mode: LaunchMode.externalApplication
                   );
                }),







              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textCard(String head,String content){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
        CustomTextStyles.head(head,
            AppMediaQuery.textFactor(context) * 18),
        CustomTextStyles.subtext(content,
            AppMediaQuery.textFactor(context) * 14, TextAlign.start)
      ],
    );
  }

  Widget CustomCard(String units, String capacity, String value) {
    return Card(
      elevation: 0,
      color: CustomColor.lightorange(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppMediaQuery.screenHeight(context) / 40,
            horizontal: AppMediaQuery.screenWidth(context) / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextStyles.head("Average Monthly\nConsumption",
                    AppMediaQuery.textFactor(context) * 14),
                CustomTextStyles.subtext(units,
                    AppMediaQuery.textFactor(context) * 14, TextAlign.start)
              ],
            ),
            SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextStyles.head("Suitable Rooftop\nSolar Capacity",
                    AppMediaQuery.textFactor(context) * 14),
                CustomTextStyles.subtext(capacity,
                    AppMediaQuery.textFactor(context) * 14, TextAlign.end)
              ],
            ),
            SizedBox(height: AppMediaQuery.screenHeight(context) / 60,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextStyles.head("Subsidy Provided",
                    AppMediaQuery.textFactor(context) * 14),
                CustomTextStyles.subtext(value,
                    AppMediaQuery.textFactor(context) * 14, TextAlign.start)
              ],
            ),
          ],
        ),
      ),
    );


  }
}
