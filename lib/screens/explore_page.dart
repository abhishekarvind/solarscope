import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/energy_production_page.dart';
import 'package:solarscope/screens/estimation_page.dart';
import 'package:solarscope/utils/companies_info_model.dart';
import 'package:solarscope/utils/responsive.dart';
import 'package:solarscope/utils/textstyles.dart';

import '../utils/colors.dart';


class ExplorePage extends StatefulWidget {
  final String name;
  final String image;
  final String content;
  final List<String> model;
  final List<String> Pmax;
  final List<String> voltage;
  final List<String> current;
  const ExplorePage({super.key, required this.name, required this.image, required this.content, required this.model, required this.Pmax, required this.voltage, required this.current});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: AppMediaQuery.screenHeight(context)/30,horizontal: AppMediaQuery.screenWidth(context)/40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                        child: Image.asset("assets/backlogo.png",height: AppMediaQuery.screenHeight(context)/3,)),
                    Image.asset(widget.image+".png",height: 90,width: 90,)
                  ],),
                SizedBox(height: AppMediaQuery.screenHeight(context)/50,),
                CustomTextStyles.head(widget.name, AppMediaQuery.textFactor(context)*24),
                SizedBox(height: AppMediaQuery.screenHeight(context)/50,),
                CustomTextStyles.subtext(widget.content, AppMediaQuery.textFactor(context)*14.0,TextAlign.start),
                SizedBox(height: AppMediaQuery.screenHeight(context)/40,),
                ListView.builder(itemCount: widget.model.length,
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          PersistentNavBarNavigator.pushNewScreen(context, screen: EstimationPage(),
                          pageTransitionAnimation: PageTransitionAnimation.fade
                          );
                        },
                        child: Card(elevation: 0,
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          color: CustomColor.lightorange(),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomTextStyles.head(widget.model[index], 22),
                                  SizedBox(height: AppMediaQuery.screenHeight(context)/60,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      card("PMax", widget.Pmax[index]),
                                      card("Vmp", widget.voltage[index]),
                                    ],
                                  ),
                                  card("Imp", widget.current[index]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget card(String title,String content){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextStyles.subtext(title,AppMediaQuery.textFactor(context)*14,TextAlign.end),
        Padding(padding:EdgeInsets.symmetric(horizontal: AppMediaQuery.screenWidth(context)/12) ,child: CustomTextStyles.head(content, AppMediaQuery.textFactor(context)*24),)
      ],
    );
  }
}
