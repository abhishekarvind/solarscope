import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solarscope/screens/mainhome.dart';
import 'package:solarscope/utils/button.dart';
import 'package:solarscope/utils/colors.dart';
import 'package:solarscope/utils/responsive.dart';
import 'package:solarscope/utils/textstyles.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.orangeAccent,
                      Colors.orange.withOpacity(0.1),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5, 0.6],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/logo.png",
                        height: 140,
                      ),
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Solar",
                                style: TextStyle(
                                    fontSize: AppMediaQuery.textFactor(context) *
                                        35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Scope",
                                style: TextStyle(
                                    fontSize: AppMediaQuery.textFactor(context) *
                                        35,
                                    color: CustomColor.orange(),
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        CustomTextStyles.subtext(
                            "Your pocket guide to solar living.\nExplore, estimate, and embrace a sustainable future.",
                            AppMediaQuery.textFactor(context) * 16,
                            TextAlign.center),
                      ],
                    ),
                    CustomButton.button(
                        "Get Started",
                        CustomColor.orange(),
                        Colors.white, () async {
                      final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setInt("startPage", 1);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainHome()));
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
