import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Models/Hadith Model.dart';
import '../../../constrains/AssetManager.dart';
import '../../style/reusable widgets/Hadith Widget.dart';
class HadithTab extends StatefulWidget {
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  PageController controller = PageController(viewportFraction: 0.8,);
  @override
  void initState() {
    super.initState();
    loadFile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetManager.ahadethback),fit: BoxFit.fitWidth)
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(AssetManager.logo,height: 151,width: 291,),),
          SizedBox(height: 55,),
          Expanded(
            child: ahadeth.isEmpty
                ?Center(child: CircularProgressIndicator(),)
                :PageView.builder(

              controller:controller ,
              itemCount: ahadeth.length,
              itemBuilder: (context, index) => HadithWidget(
                hadithModel: ahadeth[index],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<HadithModel> ahadeth = [];

  void loadFile()async{
    String text =  await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> tempAhadeth = text.split("#");
    for(int i=0;i<tempAhadeth.length;i++){
      List<String> hadethLines = tempAhadeth[i].trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join(" ");
      ahadeth.add(HadithModel(title: title, content: content));
    }
    setState(() {

    });
  }
}


/*Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorsManager.secondary.withOpacity(0.7),
              ColorsManager.secondary
            ],
            end: Alignment.bottomCenter,begin: Alignment.topCenter)
          ),
          child: Image.asset(AssetManager.ahadethback)
        )
      ],
    );*/


