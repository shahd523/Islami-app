import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neww/Models/SuraModel.dart';
import 'package:neww/constrains/AssetManager.dart';
import 'package:neww/constrains/ColorsManager.dart';
import 'package:neww/constrains/StringsManager.dart';
import 'package:neww/ui/style/reusable%20widgets/PrefHelper.dart';
import 'package:neww/ui/style/reusable%20widgets/RecentlySuraWidget.dart';
import 'package:neww/ui/style/reusable%20widgets/SuraList.dart';

import '../../../constrains/ListOfSuras.dart';

class QuraanTab extends StatefulWidget {
  @override
  State<QuraanTab> createState() => _QuraanTabState();
}

class _QuraanTabState extends State<QuraanTab> {
  List<SuraModel> filterList = [];

  String searchValue = "";

  List<SuraModel> mostRecentList = [];

  void initState() {
    super.initState();
    mostRecentList = PrefHelper.getRecentList();
    print(mostRecentList.length);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetManager.homeback),
                fit: BoxFit.fitWidth)),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetManager.logo,
                  width: 291,
                  height: 151,
                )),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                  searchSura(value);
                });
              },
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsManager.teritary,
                  fontFamily: "Janna"),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  isCollapsed: true,
                  fillColor: ColorsManager.secondary.withOpacity(0.7),
                  filled: true,
                  hintText: "Enter Sura Name",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Janna",
                      color: ColorsManager.teritary),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 54, maxWidth: 54),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(AssetManager.quraanicon),
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorsManager.primary))),
            ),
            SizedBox(
              height: 20,
            ),
            if (searchValue.isEmpty) ...[
              if (mostRecentList.isNotEmpty) ...[
                Text(
                  StringsManager.mostrecently,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Janna",
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.teritary),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RecentlySuraWidget(
                            suraModel: mostRecentList[index],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: mostRecentList.length),
                ),
              ]
            ],
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 30,
                  ),
                  itemCount: searchValue.isNotEmpty
                      ? filterList.length
                      : suraList.length,
                  itemBuilder: (context, index) => SuraList(
                    addToRecent: () {
                      for (int i = 0; i < mostRecentList.length; i++) {
                        if (mostRecentList[i].suraNameEn ==
                            (searchValue.isNotEmpty
                                ? filterList[index].suraNameEn
                                : suraList[index].suraNameEn)) {
                          mostRecentList.removeAt(i);
                        }
                      }

                      mostRecentList.insert(
                          0,
                          searchValue.isNotEmpty
                              ? filterList[index]
                              : suraList[index]);
                      PrefHelper.addRecntList(mostRecentList);
                      setState(() {});
                    },
                    suraModel: searchValue.isNotEmpty
                        ? filterList[index]
                        : suraList[index],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  searchSura(String searchText) {
    filterList = [];
    /*for(int i=0;i<suraList.length;i++){
      if(suraList[i].suraNameEn.contains(searchText) || suraList[i].suraNameAr.contains(searchText)){
        // filter sura list
        filterList.add(suraList[i]);
      }
    }*/
    filterList = suraList
        .where((element) =>
            element.suraNameEn
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            element.suraNameAr.contains(searchText))
        .toList();
    print("filter list lenght : ${filterList.length}");
  }
}
