import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/explore_page.dart';
import 'package:solarscope/utils/colors.dart';
import 'package:solarscope/utils/companies_info_model.dart';
import 'package:solarscope/utils/responsive.dart';
import 'package:solarscope/utils/solar_facts_model.dart';
import 'package:solarscope/utils/textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentIndex = 0;
  List<Companies> Cdata = [];

  @override
  void initState() {
    super.initState();
    loadData();
    _startAutoScrolling();

  }

  @override
  void dispose() {
    _stopAutoScrolling();
    _pageController.dispose();
    super.dispose();
  }
  Future<void> loadData() async {
    List<Companies> data = await loadCompanyData();
    setState(() {
      Cdata = data.toList();
    });
  }

  void _startAutoScrolling() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        if (_currentIndex < SolarFacts.data.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoScrolling() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Image.asset(
            "assets/logo.png",
            height: 60,
          ),
          toolbarHeight: 80,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppMediaQuery.screenHeight(context) / 30,
              horizontal: AppMediaQuery.screenWidth(context) / 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextStyles.head("Welcome", AppMediaQuery.textFactor(context) * 24),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40),
                SizedBox(
                  height: AppMediaQuery.screenHeight(context) / 4,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: SolarFacts.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        color: CustomColor.lightorange(),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      SolarFacts.data[index].image + ".png",
                                      height: 65,
                                    ),
                                    Container(
                                      width: AppMediaQuery.screenWidth(context) / 1.5,
                                      child: CustomTextStyles.subtext(
                                        SolarFacts.data[index].content,
                                        14.0,
                                        TextAlign.start,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40),
                CustomTextStyles.head("Explore", AppMediaQuery.textFactor(context) * 24),
                SizedBox(height: AppMediaQuery.screenHeight(context) / 40),
                ListView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: Cdata.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context, screen: ExplorePage(
                          name: Cdata[index].name,
                          image: Cdata[index].image,
                          content: Cdata[index].content,
                          current: Cdata[index].current,
                          Pmax: Cdata[index].Pmax,
                          voltage: Cdata[index].voltage,
                          model: Cdata[index].model,
                        ));
                      },
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        color: CustomColor.lightorange(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 40),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "${Cdata[index].image}.png",
                                    height: 56,
                                    width: 56,
                                  ),
                                  SizedBox(
                                    width: AppMediaQuery.screenWidth(context) / 1.5,
                                    child: CustomTextStyles.subtext(
                                      Cdata[index].title,
                                      AppMediaQuery.textFactor(context) * 14.0,
                                      TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
