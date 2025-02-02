import 'package:flutter/cupertino.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/ui/SuraDetails/Screen.dart';

import '../../../Models/SuraModel.dart';

class RecentlySuraWidget extends StatelessWidget{
  final SuraModel suraModel;
  const RecentlySuraWidget({super.key,required this.suraModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: suraModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.primary,

      ),
      child: Row(
        children: [
      Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(suraModel.suraNameEn,style:TextStyle(fontWeight: FontWeight.w700
                ,fontFamily: "Janna",fontSize: 28,
                color: ColorsManager.secondary)),
            Text(suraModel.suraNameAr,style:TextStyle(fontWeight: FontWeight.w700
                ,fontFamily: "Janna",fontSize: 28,
                color: ColorsManager.secondary)),
            Text("${suraModel.versesNumber} Verses  ",style:TextStyle(fontWeight: FontWeight.w700
                ,fontFamily: "Janna",fontSize: 14,
                color: ColorsManager.secondary)),

          ],
        ),
      ),
      Image.asset(AssetManager.quraancard)
        ],
      ),
      ),
    );
  }

}