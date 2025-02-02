import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neww/Models/SuraModel.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
import 'package:neww/ui/SuraDetails/Screen.dart';
class SuraList extends StatelessWidget{
   final SuraModel suraModel;
   final Function() addToRecent;
  SuraList({ required this.suraModel, required this.addToRecent});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        addToRecent();
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,arguments:suraModel);
        
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetManager.suranum,
              height: 52,
              width: 52),
              Text(suraModel.suraNumber.toString(),style: TextStyle(fontWeight: FontWeight.w700
              ,fontFamily: "Janna",fontSize: 28,
              color: ColorsManager.teritary),),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style:TextStyle(fontWeight: FontWeight.w700
                  ,fontFamily: "Janna",fontSize: 28,
                  color: ColorsManager.teritary)),
                Text( "${suraModel.versesNumber}Verses",style:TextStyle(fontWeight: FontWeight.w700
                  ,fontFamily: "Janna",fontSize: 14,
                  color: ColorsManager.teritary)),

              ],

            ),
          ),
          Text(suraModel.suraNameAr,style:TextStyle(fontWeight: FontWeight.w700
              ,fontFamily: "Janna",fontSize: 28,
              color: ColorsManager.teritary)),
        ],
      ),
    );

  }

}