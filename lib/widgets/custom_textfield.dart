import 'package:flutter/material.dart';
import 'package:r_form/utils/conts.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool readOnly;
  final bool? enableHide, showLeading, showTrailing;
  final String? label, hintText;
  final TextEditingController? controller;
  final bool obscureText, enabled, checkerValue, isVisiblePrefix;
  final int? maxLines, minLines;
  final Function? onTap;
  final int? maxLength;
  final double? labelSize;
  final String Function(String?)? validator;
  final Widget? prefix;
  final IconData? prefixIcon;
  final TextCapitalization textCapitalization;
  final double? fontSize;
  final FontWeight? fontWeight;
  CustomTextField(
      {this.controller,
      this.label,
      this.enableHide = false,
      this.onChanged,
      this.showLeading = false,
      this.textInputType,
      this.readOnly = false,
      this.showTrailing = false,
      this.obscureText = false,
      this.maxLines,
      this.hintText = "",
      this.onTap,
      this.enabled = true,
      this.maxLength,
      this.minLines,
      this.labelSize = 14,
      this.validator,
      this.prefix,
      this.textCapitalization = TextCapitalization.none,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w600,
      this.prefixIcon,
      required this.checkerValue,
      this.isVisiblePrefix = false});

  @override
  _TextFieldStatePoppins createState() => _TextFieldStatePoppins();
}

class _TextFieldStatePoppins extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.textInputType,
      style: TextStyle(
          color: widget.checkerValue == false
              ? DefaultColors.kred
              : DefaultColors.kBlue,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontSize),
      obscureText: widget.obscureText,
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      validator: widget.validator,
      onChanged: widget.onChanged,
      textCapitalization: widget.textCapitalization,
      onTap: () {
        widget.onTap!();
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        counterStyle: TextStyle(fontSize: 12, color: DefaultColors.black),
        labelText: widget.hintText,
        alignLabelWithHint: true,
        fillColor: widget.checkerValue == false
            ? DefaultColors.kFillColor
            : DefaultColors.kDisabledBorder,
        filled: true,
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.checkerValue)
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: DefaultColors.kBlue, shape: BoxShape.circle),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
          ],
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: widget.checkerValue == false
              ? DefaultColors.kGreyDark
              : DefaultColors.kBlue,
          size: 22,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: widget.isVisiblePrefix ? 10 : 45,
          minHeight: 45,
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: DefaultColors.kred)),
        focusedBorder: widget.readOnly
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: DefaultColors.kred, width: 1.2),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: widget.checkerValue == false
                        ? DefaultColors.kred
                        : DefaultColors.kBlue,
                    width: 1.2)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: DefaultColors.kDefultBorder,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: DefaultColors.kred)),
        labelStyle: TextStyle(
          fontSize: 16,
          color: DefaultColors.kHint,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
