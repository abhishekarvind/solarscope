import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:solarscope/screens/care_hub.dart';
import 'package:solarscope/screens/chatbot_page.dart';

import '../utils/colors.dart';
import 'homescreen.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late PersistentTabController _controller= PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      floatingActionButton:FloatingActionButton(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/chatbot.png"),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ) ,
      context,
      screens: [
        const HomeScreen(),
        const CareHub(),
      ],
      controller:_controller,
      backgroundColor: Colors.white,
      items: [
        PersistentBottomNavBarItem(icon: Icon(Icons.home_filled),
          title: ("Home"),
          activeColorSecondary: Colors.black,
          activeColorPrimary: CustomColor.orange(),
        ),PersistentBottomNavBarItem(icon: Icon(Icons.settings),
          title: ("Care Hub"),
          activeColorSecondary: Colors.black,
          activeColorPrimary: CustomColor.orange(),
        ),

      ],
    );
  }
}
