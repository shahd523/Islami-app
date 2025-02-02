import 'package:flutter/material.dart';
import '../../Models/Hadith Model.dart';
import '../../constrains/AssetManager.dart';
import '../../constrains/ColorsManager.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = "hadithdetails";
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel = ModalRoute.of(context)!.settings.arguments as HadithModel;
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
          hadithModel.title,
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
                        child: Text(hadithModel.title,
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
                    child:SingleChildScrollView(
                      child: Text(hadithModel.content,
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
}