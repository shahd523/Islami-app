
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import '../../Models/SuraModel.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suradetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraText = "";
  late SuraModel suraModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(suraText.isEmpty){
      loadFile(suraModel.suraNumber.toString());
    }
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            color: ColorsManager.primary
        ),
        centerTitle: true,
        title: Text(
          suraModel.suraNameEn,
          style: TextStyle(
              fontFamily: "Janna",
              color: ColorsManager.primary,
              fontWeight: FontWeight.w700,
              fontSize: 24
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(

                    children: [
                      Image.asset(
                          AssetManager.rightcorner
                      ),
                      Expanded(
                        child: Text(suraModel.suraNameAr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Janna",
                              color: ColorsManager.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 24
                          ),),
                      ),
                      Image.asset(
                          AssetManager.leftcorner
                      ),
                    ],
                  ),
                  SizedBox(height: 19,),
                  Expanded(
                    child:suraText.isEmpty
                        ?Center(child: CircularProgressIndicator(
                      color: ColorsManager.primary,
                    ),)
                        :SingleChildScrollView(
                      child: Text(suraText,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsManager.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Janna"
                        ),),
                    ) ,
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            AssetManager.bottommosque,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  int add(int n1 , int n2){
    return n1+n2;
  }

  loadFile(String suraNumber)async{// blocking code style bykhli lshoghl asyncronus w bytb2 mabd2 zai l multi threading but dart is asingle thread

    suraText = await rootBundle.loadString("assets/files/$suraNumber.txt"); // non-blocking code
    List<String>lines =  suraText.split("\n");
    String temp = "";
    for(int i=0;i<lines.length;i++){
      temp+=lines[i].trim();
      temp+="(${i+1})";
    }
    suraText = temp;
    setState(() {

    });
  }
}