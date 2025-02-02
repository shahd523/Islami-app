import 'package:flutter/material.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
class SebhaTab extends StatefulWidget{
  static const String routename="sebha";
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count=0;
  String zekr="سبحان الله";
  int temp=0;
int angl=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetManager.sebhaback),fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetManager.logo),
          SizedBox(height: 20,),
          Text(StringsManager.sebha,style: TextStyle(fontSize: 24,fontFamily: "Janna",
            fontWeight: FontWeight.w700,color:ColorsManager.teritary,)
            ,textAlign:TextAlign.center,),
          SizedBox(height: 15,),
          Align(alignment: Alignment.center,
            child: Column(mainAxisSize: MainAxisSize.min,
                children: [Image.asset(AssetManager.head,fit: BoxFit.fitHeight,),
              Align(alignment: Alignment.center,
                child: GestureDetector(
                  onTap: increment,
                  child: Stack(
                    children: [
                      Transform.rotate(
                          angle:angl+180,
                          child: Image.asset(AssetManager.body,fit: BoxFit.fitHeight)),
                      Align(alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top:100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$zekr",style: TextStyle(fontSize: 24,fontFamily: "Janna",
                                fontWeight: FontWeight.w700,color: ColorsManager.teritary,)
                                ,textAlign: TextAlign.center,),
                              Text("$count",style: TextStyle(fontSize: 24,fontFamily: "Janna",
                                fontWeight: FontWeight.w700,color: ColorsManager.teritary,)
                                ,textAlign: TextAlign.center,),]),
                        ),
                      ),
                            ]),
                ),
              ),
                ],
              ),




          )
        ],
      ),
    );
  }

  void increment() {
    count++;
    angl++;
    if (count > 33) {
      temp += count;
      count = 0;
      if(temp==34){
        zekr="الحمدلله";
        print(temp);
        count=0;
      }
      else if(temp==68){
        zekr="لا اله الا الله";
        print(temp);
        count=0;

      }
      else if(temp==102){
        zekr="الله اكبر";
        print(temp);
        count=0;

      }
      else if(temp==136){
        zekr="سبحان الله";
        temp=0;
        print(temp);
        count=0;

      }

    }

    setState(() {});

  }
}