import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/energy_production_page.dart';
import 'package:solarscope/screens/scheme_page.dart';
import 'package:solarscope/utils/button.dart';
import 'package:solarscope/utils/colors.dart';
import 'package:solarscope/utils/estimate_model.dart';
import '../utils/responsive.dart';
import '../utils/textstyles.dart';


class EstimationPage extends StatefulWidget {
  const EstimationPage({super.key});

  @override
  State<EstimationPage> createState() => _EstimationPageState();
}

class _EstimationPageState extends State<EstimationPage> {
  String selectedItem = "Select";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context)/30,horizontal: AppMediaQuery.screenWidth(context)/30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyles.head("Energy Production", 24.0),
                  CustomTextStyles.subtext("Select your rooftop and get your estimation", 14.0, TextAlign.start),
                  SizedBox(height: AppMediaQuery.screenHeight(context)/40,),
                  Center(child: Image.asset("assets/estimate.png",height: AppMediaQuery.screenHeight(context)/4,)),
                  SizedBox(height: AppMediaQuery.screenHeight(context)/20,),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: AppMediaQuery.screenHeight(context)/20,
                      width: AppMediaQuery.screenWidth(context)/3,
                      decoration: BoxDecoration(
                        color: CustomColor.orange(),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: DropdownButton(
                        elevation: 0,
                        dropdownColor: CustomColor.lightorange(),
                        value: selectedItem,
                        items: [
                          DropdownMenuItem(
                            child: Text("Select"),
                            value: "Select",
                          ),
                          DropdownMenuItem(
                            child: CustomTextStyles.subtext("1kwp", 16.0, TextAlign.center),
                            value: "1kwp",
                          ),
                          DropdownMenuItem(
                            child: CustomTextStyles.subtext("2kwp", 16.0, TextAlign.center),
                            value: "2kwp",
                          ),
                          DropdownMenuItem(
                            child: CustomTextStyles.subtext("3kwp", 16.0, TextAlign.center),
                            value: "3kwp",
                          ),
                          DropdownMenuItem(
                            child: CustomTextStyles.subtext("4kwp", 16.0, TextAlign.center),
                            value: "4kwp",
                          ),
                          DropdownMenuItem(
                            child: CustomTextStyles.subtext("5kwp", 16.0, TextAlign.center),
                            value: "5kwp",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value.toString();
                            print(selectedItem);
                          });
                        },
                      ),
                    ),
                  ),
              SizedBox(
                child: ListView.builder(
                  itemCount: 1,
                  physics: PageScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data=estimate.getDataForValue(selectedItem);
                    if (data!=null) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context) / 30, horizontal: AppMediaQuery.screenWidth(context) / 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            singleCard(data.solarPlant, "Solar Plant Qty", ""),
                            doubleCard(data.solarStructure,data.inverter, "Solar Structure", "On grid inventer", "KW", "KW"),
                            singleCard(data.mc, "MC4 Connector", ""),
                            doubleCard(data.dc, data.ac, "DC junction box", "AC junction box", " nos", " nos"),
                            singleCard(data.space, "Space Required", "sq ft"),
                            data.value=="Select"?Container(): SizedBox(height: AppMediaQuery.screenHeight(context) / 30),
                            data.value=="Select"?Container(): CustomTextStyles.head("Solar Accessories", 24.0),
                            data.value=="Select"?Container():SizedBox(height: AppMediaQuery.screenHeight(context) / 30),
                            data.value=="Select"?Container(): Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightorange(),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomTextStyles.subtext(" Fasters ", AppMediaQuery.textFactor(context) * 14.0, TextAlign.center),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightorange(),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomTextStyles.subtext(" Cable Tie ", AppMediaQuery.textFactor(context) * 14.0, TextAlign.center),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightorange(),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomTextStyles.subtext(" Crimping Tool ", AppMediaQuery.textFactor(context) * 14.0, TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppMediaQuery.screenHeight(context) / 30),
                            data.value=="Select"?Container():Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightorange(),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomTextStyles.subtext(" Earthing Kit ", AppMediaQuery.textFactor(context) * 14.0, TextAlign.center),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightorange(),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomTextStyles.subtext(" Lighting Arresstor ", AppMediaQuery.textFactor(context) * 14.0, TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                            data.value=="Select"?Container():SizedBox(height: AppMediaQuery.screenHeight(context) / 30),
                            singleCard(data.cost, "Total Cost", " RS"),
                            SizedBox(height: AppMediaQuery.screenHeight(context) / 40),
                            GestureDetector(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(context, screen: SchemePage(),
                                    pageTransitionAnimation: PageTransitionAnimation.fade
                                );
                              },
                              child: Center(
                                child: CustomTextStyles.head("Apply for PMSuryaGhar scheme", AppMediaQuery.textFactor(context) * 14),
                              ),
                            ),
                            SizedBox(height: AppMediaQuery.screenHeight(context) / 40),
                            CustomButton.button("Monthly Value", CustomColor.orange(), Colors.black, () {
                              PersistentNavBarNavigator.pushNewScreen(context, screen: EnergyProuction(),
                                  pageTransitionAnimation: PageTransitionAnimation.fade);
                            }),
                          ],
                        ),
                      );
                    }
                    if(selectedItem.toString()=="Select") {
                      return Center(
                        heightFactor: 2,
                        child: Image.asset("assets/calculate.gif"),
                      );
                    }
                  },
                ),
              ),



              ],
              ),
            ),
          ),
        )

    );
  }
  Widget singleCard(int value,String name,String symbol){
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      color: CustomColor.lightorange(),
      child: Container(
        height: AppMediaQuery.screenHeight(context)/5,
        width: AppMediaQuery.screenWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMediaQuery.screenWidth(context)/20,vertical: AppMediaQuery.screenHeight(context)/20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextStyles.subtext(value.toString()+symbol, AppMediaQuery.textFactor(context)*26.0,TextAlign.start),
                  CustomTextStyles.head(name, 16),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget doubleCard(int value1,int value2,String name1,String name2,String symbol1,String symbol2){
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
