import 'package:neww/Models/SuraModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constrains/ListOfSuras.dart';

class PrefHelper{
  static late SharedPreferences prefs;
  static  init()async{
    prefs=await SharedPreferences.getInstance();
  }
  static addRecntList(List<SuraModel>mostrecentlist){
    List<String> mostRecentStringList = mostrecentlist.map((sura) => sura.suraNameEn).toList();
    prefs.setStringList("mostRecent", mostRecentStringList);
  }
  static getRecentList(){
    List<String> mostStringList = prefs.getStringList("mostRecent")??[];
    List<SuraModel> mostRecent = [];
    for(String suraName in mostStringList){
      SuraModel suraFound =  suraList.firstWhere((sura) => sura.suraNameEn==suraName);
      mostRecent.add(suraFound);
    }
    return mostRecent;


  }
}