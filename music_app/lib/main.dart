import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/modules/bottom%20navigation%20bar/bottom_navigation_ui.dart';
import 'package:music_app/theme/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white,primary:ThemeColors.primaryColor ),
        useMaterial3: true,
      ),
      home: BottomNavigationUI(),
    );
  }
}

