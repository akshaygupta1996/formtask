import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:r_form/controller/country_controller.dart';
import 'package:r_form/model/country_model.dart';
import 'package:r_form/utils/conts.dart';
import 'package:r_form/widgets/textbuilder.dart';
import 'dart:developer' as dev;

class CountryPop extends StatefulWidget {
  Function(String)? callBack;
  CountryPop({Key? key, this.callBack}) : super(key: key);

  @override
  _CountryPopState createState() => _CountryPopState();
}

class _CountryPopState extends State<CountryPop> {
  String? selectedFag = countryList.first.img;
  List<Country> _searchList = [];
  @override
  void initState() {
    super.initState();
    _searchList.clear();
    _searchList.addAll(countryList);
  }

  onSearch(String search) {
    setState(() {
      _searchList = countryList
          .where((e) =>
              e.name
                  .toLowerCase()
                  .toLowerCase()
                  .contains(search.toLowerCase().toString()) ||
              e.isoCode
                  .toLowerCase()
                  .toLowerCase()
                  .contains(search.toLowerCase().toString()))
          .toList();
    });
    dev.log('Search: $search');
    dev.log('Total Items: ${_searchList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: TextBuilder(
            text: 'Select Country / Regions'.tr(),
            color: DefaultColors.kBlue,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (v) => onSearch(v),
                  decoration: InputDecoration(hintText: 'Browse'.tr()),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: _searchList.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.callBack!(_searchList[i].img);
                                selectedFag = _searchList[i].img;
                                dev.log('selectedFag: $selectedFag');
                              });
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage(_searchList[i].img),
                                ),
                                const SizedBox(width: 20.0),
                                Expanded(
                                  child: TextBuilder(
                                    text:
                                        '${_searchList[i].name} (${_searchList[i].isoCode})',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
