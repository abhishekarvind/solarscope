import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solarscope/screens/energy_produced_time.dart';
import 'package:solarscope/screens/energy_production_page.dart';
import 'package:solarscope/screens/estimation_page.dart';
import 'package:solarscope/screens/mainhome.dart';
import 'package:solarscope/screens/start_screen.dart';
import 'package:solarscope/utils/colors.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? startPage = preferences.getInt("startPage");
  runApp(MyApp(startPage: startPage));
}

class MyApp extends StatelessWidget {
  final int? startPage;
  const MyApp({Key? key, this.startPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.orange()),
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: startPage == 1 ? MainHome() : GetStarted(),
    );
  }
}
