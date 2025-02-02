import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/StringsManager.dart';

class OnBoardingModel{
  String sora;
  String text1;
  String text2;
  OnBoardingModel({required this.sora,required this.text1,required this.text2});
  static List<OnBoardingModel>onbourding=[
    OnBoardingModel(sora: AssetManager.onboard1, text1:StringsManager.onboard1 , text2:" "),
    OnBoardingModel(sora: AssetManager.onboard2, text1:StringsManager.onboard2 , text2: StringsManager.onboard22),
    OnBoardingModel(sora: AssetManager.onboard3, text1:StringsManager.onboard31, text2: StringsManager.onboard32),
    OnBoardingModel(sora:AssetManager.onboard4 , text1: StringsManager.onboard41, text2:StringsManager.onboard42),
    OnBoardingModel(sora:AssetManager.onboard5 , text1: StringsManager.onboard51, text2: StringsManager.onboard52),
  ];

}