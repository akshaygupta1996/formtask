import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:r_form/utils/conts.dart';
import 'package:r_form/widgets/textbuilder.dart';

class CustomDropDown extends StatefulWidget {
  String? selectedDoc;
  final List<String> items;
  CustomDropDown({Key? key, this.selectedDoc, required this.items})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.selectedDoc,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.transparent,
        ),
        elevation: 16,
        isExpanded: true,
        iconSize: 20,
        hint: TextBuilder(
          text: 'Choose Documents'.tr(),
          fontSize: 20,
          color: DefaultColors.kBlue,
          fontWeight: FontWeight.w600,
        ),
        underline: Container(
          height: 2,
          color: Color(0xff2AA7FF),
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.selectedDoc = newValue!;
          });
        },
        items: widget.items.map((e) {
          return DropdownMenuItem<String>(
            value: e.toString(),
            child: TextBuilder(
              text: e,
              fontSize: 20,
              color: DefaultColors.kBlue,
              fontWeight: FontWeight.w600,
            ),
          );
        }).toList(),
      ),
    );
  }
}
