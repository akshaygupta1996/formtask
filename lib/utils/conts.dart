import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DefaultColors {
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color kFillColor = Color(0xffD2D8DC);
  static Color kGreyDark = Color(0xff6F7579);
  static Color kBlue = Color(0xff1F58AB);
  static Color kred = Colors.red;
  static Color kDisabledBorder = Color(0xffEDEAED);
  static Color kHint = Color(0xff647184);
  static Color kDefultBorder = Color(0xff8A9099);
}

class DefaultValue {
  static const String languageKey = "en";
  static const String completeYourregistration = "en";
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp phoneRegExp = RegExp(r"(^(?:[+0]9)?[0-9]{10,12}$)");

  static List<String> typeOfDocuemnts = ['Aadhar Card'.tr(), 'Pan Card'.tr()];
}
