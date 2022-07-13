import 'package:flutter/material.dart';
import 'package:r_form/utils/conts.dart';

class CustomCheckBox extends StatelessWidget {
  final Function()? onTap;
  final bool? isChecked;
  const CustomCheckBox({
    Key? key,
    this.onTap,
    this.isChecked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isChecked == false ? Color(0xff918F92) : DefaultColors.kBlue,
        ),
        child: Icon(
          Icons.check,
          color: isChecked == false ? Color(0xff918F92) : DefaultColors.white,
        ),
      ),
    );
  }
}
