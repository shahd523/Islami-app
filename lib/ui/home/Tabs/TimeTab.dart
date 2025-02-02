import 'package:flutter/material.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
class TimeTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage(AssetManager.timeback),fit: BoxFit.fill)
     ),
   );
  }

}