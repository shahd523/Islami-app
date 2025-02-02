 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
import 'package:neww/ui/home/Tabs/AhadithTab.dart';
import 'package:neww/ui/home/Tabs/QuraanTab.dart';
import 'package:neww/ui/home/Tabs/RadioTab.dart';
import 'package:neww/ui/home/Tabs/SebhaTab.dart';
import 'package:neww/ui/home/Tabs/TimeTab.dart';

class HomeScreen extends StatefulWidget{
  static const  String routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget>Tabs=[QuraanTab()
  ,HadithTab(),SebhaTab(),RadioTab(),TimeTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset:false,
      bottomNavigationBar: NavigationBar(
          backgroundColor: ColorsManager.primary,
          indicatorColor: ColorsManager.navitemback,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index){
            setState(() {
              selectedIndex=index;
            });
          },


          destinations: [
        NavigationDestination(icon:SvgPicture.asset(AssetManager.quraanicon,
          colorFilter: ColorFilter.mode(
            ColorsManager.secondary,BlendMode.srcIn
          ),
        ),
            label:StringsManager.quraanlabel,selectedIcon: SvgPicture.asset(AssetManager.quraanicon,
              colorFilter: ColorFilter.mode(
                  ColorsManager.teritary
                  ,BlendMode.srcIn
              ),
            ),)
      ,NavigationDestination(icon:SvgPicture.asset(AssetManager.ahadethicon
              ,colorFilter: ColorFilter.mode(
                ColorsManager.secondary,BlendMode.srcIn
            ),
            ), label:StringsManager.ahadethlabel,
              selectedIcon: SvgPicture.asset(AssetManager.ahadethicon,
              colorFilter: ColorFilter.mode(
                  ColorsManager.teritary
                  ,BlendMode.srcIn
              ),
            ),)
      ,NavigationDestination(icon:SvgPicture.asset(AssetManager.sebhaicon
              ,colorFilter: ColorFilter.mode(
    ColorsManager.secondary,BlendMode.srcIn
    ),), label:StringsManager.Sebhalabel,selectedIcon: SvgPicture.asset(AssetManager.sebhaicon,
              colorFilter: ColorFilter.mode(
                  ColorsManager.teritary
                  ,BlendMode.srcIn
              ),
            ),)
      ,NavigationDestination(icon:SvgPicture.asset(AssetManager.radioicon
              ,colorFilter: ColorFilter.mode(
                ColorsManager.secondary,BlendMode.srcIn
            ),), label:StringsManager.Radiolabel,selectedIcon: SvgPicture.asset(AssetManager.radioicon,
              colorFilter: ColorFilter.mode(
                  ColorsManager.teritary
                  ,BlendMode.srcIn
              ),
            ),)
      ,NavigationDestination(icon:SvgPicture.asset(AssetManager.timeicon
              ,colorFilter: ColorFilter.mode(
                ColorsManager.secondary,BlendMode.srcIn
            ),), label:StringsManager.Timelabel,selectedIcon: SvgPicture.asset(AssetManager.timeicon,
    colorFilter: ColorFilter.mode(
    ColorsManager.teritary
    ,BlendMode.srcIn
    ),
    ),)

      ]),
      body:Tabs[selectedIndex],
    );
  }
}