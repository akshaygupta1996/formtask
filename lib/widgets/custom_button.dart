import 'package:flutter/material.dart';
import 'package:r_form/utils/conts.dart';
import 'package:r_form/widgets/textbuilder.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final bool? isAccepted;
  const CustomButton({
    Key? key,
    this.text,
    this.onTap,
    this.isAccepted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isAccepted == true ? DefaultColors.kBlue : Color(0xff918F92),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: TextBuilder(
            text: text,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
