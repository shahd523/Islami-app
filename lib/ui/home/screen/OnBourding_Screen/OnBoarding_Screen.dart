import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/Models/OnBoarding_Model.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/StringsManager.dart';
import 'package:neww/ui/home/screen/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBourding_Screen extends StatefulWidget{
  static const String routeName="OnBourding";

  @override
  State<OnBourding_Screen> createState() => _OnBourding_ScreenState();
}

class _OnBourding_ScreenState extends State<OnBourding_Screen> {
  PageController pageController=PageController(initialPage: 0);

  int index = 0;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor:ColorsManager.secondary,
       body: Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Align(alignment: Alignment.center,
                 child: Image.asset(AssetManager.logo)),
             Expanded(
               child: PageView.builder(controller:pageController ,
                 itemCount: OnBoardingModel.onbourding.length,
                 onPageChanged: (value){
                 index=value;
                 setState(() {
               
                 });
                   },
                 itemBuilder: (context,index)=>Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(19),
                         child: Image.asset(OnBoardingModel.onbourding[index].sora,height: 400,),
                       ),
                       SizedBox(height: 15,),
                       Text( OnBoardingModel.onbourding[index].text1,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Janna",color: ColorsManager.primary)
                         ,),
                       SizedBox(height: 20,),
                       Text( OnBoardingModel.onbourding[index].text2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Janna",color: ColorsManager.primary)
                         ,textAlign: TextAlign.center,),


                 Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Visibility(
                           visible: index>0,
                         child:TextButton(onPressed:() {pageController.previousPage(
                             duration: Duration(milliseconds: 200),
                             curve: Curves.easeInSine);

                         } , child:Text(StringsManager.btn1,style: TextStyle(color: ColorsManager.primary,fontFamily: "Janna",fontWeight: FontWeight.w700,fontSize: 16)),))
                           ,
                       AnimatedSmoothIndicator(activeIndex:index,
                         count: OnBoardingModel.onbourding.length,effect:ExpandingDotsEffect(dotHeight: 7,
                       dotWidth: 7,activeDotColor: ColorsManager.primary,
                       dotColor: Colors.grey),)


                       ,TextButton(onPressed:(){
                       if(index>=OnBoardingModel.onbourding.length-1){
                       Navigator.pushNamed(context, HomeScreen.routeName);
                       }
                       else{
                       pageController.nextPage(
                       duration: Duration(milliseconds: 200),
                       curve: Curves.easeInSine);
                       }

                       }, child: Text(StringsManager.btn2,style: TextStyle(color: ColorsManager.primary,fontFamily: "Janna",fontWeight: FontWeight.w700,fontSize: 16)),)


                     ],)

                   ]
                      )),
             )
           ],
         ),
       ));
  }
}