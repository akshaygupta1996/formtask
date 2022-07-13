import 'package:flutter/material.dart';
import 'package:r_form/utils/conts.dart';

class ErrorMsg extends StatelessWidget {
  final bool? valueChecker;
  final String? text;
  final TextEditingController? textChecker;
  const ErrorMsg({Key? key, this.valueChecker, this.text, this.textChecker})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return textChecker!.text.isNotEmpty && valueChecker!
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 9),
              Container(
                width: 300,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xffEDDAD9),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      valueChecker! ? Icons.warning_outlined : Icons.check,
                      color: DefaultColors.kred,
                      size: 20,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      text!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.kred,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
