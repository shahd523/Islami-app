import 'package:flutter/material.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
class RadioTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetManager.radioback),fit: BoxFit.fill)
      ),
    );
  }

}