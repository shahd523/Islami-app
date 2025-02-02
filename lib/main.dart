import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neww/ui/SuraDetails/Screen.dart';
import 'package:neww/ui/home/Tabs/SebhaTab.dart';
import 'package:neww/ui/home/screen/OnBourding_Screen/OnBoarding_Screen.dart';
import 'package:neww/ui/home/screen/home.dart';
import 'package:neww/ui/splash/screen/SplashScreen.dart';

import 'ui/hadith details/hadith details screen.dart';
import 'ui/style/reusable widgets/PrefHelper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await PrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData()
        ,routes:{
        SplashScreen.routeName:(_)=>SplashScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
      SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen()
      ,HadithDetailsScreen.routeName:(_)=>HadithDetailsScreen(),
      SebhaTab.routename:(_)=>SebhaTab(),
      OnBourding_Screen.routeName:(_)=>OnBourding_Screen(),
    }
    ,initialRoute: SplashScreen.routeName
    );

  }
}
