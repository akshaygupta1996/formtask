import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:r_form/controller/country_controller.dart';
import 'package:r_form/utils/conts.dart';
import 'package:r_form/widgets/country_pop.dart';
import 'package:r_form/widgets/custom_button.dart';
import 'package:r_form/widgets/custom_checkbox.dart';
import 'package:r_form/widgets/custom_dropd_down.dart';
import 'package:r_form/widgets/custom_textfield.dart';
import 'package:r_form/widgets/error_msg.dart';
import 'package:r_form/widgets/textbuilder.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _termsCondition = false;
  bool _privacyPolicy = false;
  bool _acceptManual = false;
  bool _hasValidNumberCheck = false;
  bool _hasOptinalCheck = false;
  bool _hasEmailValidCheck = false;
  bool _hasNameCheck = false;
  bool _hasFamilyNameCheck = false;
  bool _hasNoOfDocCheck = false;
  String? selectedFag;
  String? _selectedDoc;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _familyname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _noOfDoc = TextEditingController();
  TextEditingController _optional = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedFag = countryList[0].img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEAED),
      appBar: AppBar(
        backgroundColor: Color(0xffEDEAED),
        elevation: 0,
        centerTitle: true,
        title: TextBuilder(
          text: 'Complete your Registration'.tr(),
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              CustomTextField(
                checkerValue: _hasEmailValidCheck || _email.text.contains('@'),
                controller: _email,
                onTap: () {},
                onChanged: (email) => onEmailValidation(email),
                prefixIcon: Icons.email_outlined,
                hintText: 'Email Address'.tr(),
              ),
              ErrorMsg(
                  textChecker: _email,
                  valueChecker: _hasEmailValidCheck == false,
                  text: 'Invalid email address'.tr()),
              const SizedBox(height: 20.0),
              CustomTextField(
                checkerValue: _hasNameCheck,
                onTap: () {},
                controller: _name,
                onChanged: (v) => onNameCheck(v),
                prefixIcon: Icons.person_outline,
                hintText: 'Name'.tr(),
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _familyname,
                checkerValue: _hasFamilyNameCheck,
                onChanged: (v) => onFamilyNameCheck(v),
                onTap: () {},
                prefixIcon: Icons.person_outline,
                hintText: 'Family Name'.tr(),
              ),
              const SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextBuilder(text: 'Country'.tr()),
                        ),
                        const SizedBox(height: 10.0),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              useSafeArea: true,
                              barrierDismissible: true,
                              builder: (context) {
                                return CountryPop(
                                  callBack: (v) {
                                    selectedFag = v;
                                  },
                                );
                              },
                            ).whenComplete(() {
                              setState(() {});
                            });
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: DefaultColors.kBlue,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(selectedFag!),
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: DefaultColors.kBlue,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.expand_more,
                                    color: DefaultColors.kBlue,
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextBuilder(text: 'Phone Number'.tr()),
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          checkerValue: _hasValidNumberCheck,
                          controller: _phone,
                          onChanged: (v) => onPhoneCheck(v),
                          textInputType: TextInputType.phone,
                          onTap: () {},
                          prefixIcon: Icons.phone_outlined,
                          hintText: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ErrorMsg(
                  textChecker: _phone,
                  valueChecker: _hasValidNumberCheck == false,
                  text: 'Invalid phone'.tr()),
              const SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xff8A9099), width: 1.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBuilder(
                            text: 'Types of Documents'.tr(),
                            fontSize: 14,
                            color: Color(0xff647184),
                            fontWeight: FontWeight.w600,
                          ),
                          CustomDropDown(
                            items: DefaultValue.typeOfDocuemnts,
                            selectedDoc: _selectedDoc,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: DefaultColors.kBlue, width: 2),
                        ),
                        child: Icon(
                          Icons.expand_more,
                          color: DefaultColors.kBlue,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _noOfDoc,
                checkerValue: _hasNoOfDocCheck,
                onChanged: (v) => onNoofdocCheck(v),
                onTap: () {},
                hintText: 'Number of Documents'.tr(),
                isVisiblePrefix: true,
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Icon(
                    Icons.diamond_outlined,
                    color: DefaultColors.kBlue,
                    size: 30,
                  ),
                  const SizedBox(width: 20.0),
                  TextBuilder(
                    text: 'Were you referred?'.tr(),
                    fontSize: 20,
                    color: DefaultColors.kBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: _optional,
                checkerValue: _hasOptinalCheck,
                onChanged: (v) => onOptionalCheck(v),
                textInputType: TextInputType.phone,
                onTap: () {},
                hintText: 'Enter code (no obligation)'.tr(),
                isVisiblePrefix: true,
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckBox(
                    onTap: () {
                      setState(() {
                        _termsCondition = !_termsCondition;
                      });
                    },
                    isChecked: _termsCondition,
                  ),
                  const SizedBox(width: 8.0),
                  TextBuilder(
                    text: 'Accept Terms & Conditions'.tr(),
                    color: DefaultColors.kBlue,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckBox(
                    onTap: () {
                      setState(() {
                        _privacyPolicy = !_privacyPolicy;
                      });
                    },
                    isChecked: _privacyPolicy,
                  ),
                  const SizedBox(width: 8.0),
                  TextBuilder(
                    text: 'Accept Privacy Policy'.tr(),
                    color: DefaultColors.kBlue,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckBox(
                    onTap: () {
                      setState(() {
                        _acceptManual = !_acceptManual;
                      });
                    },
                    isChecked: _acceptManual,
                  ),
                  const SizedBox(width: 8.0),
                  TextBuilder(
                    text: 'Accept all Manual'.tr(),
                    color: DefaultColors.kBlue,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline,
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              CustomButton(
                onTap: () {},
                text: 'Continue'.tr(),
                isAccepted: _privacyPolicy && _termsCondition && _acceptManual,
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  onEmailValidation(String email) {
    bool emailValid = DefaultValue.emailRegExp.hasMatch(email);
    setState(() {
      _hasEmailValidCheck = false;
      if (emailValid) _hasEmailValidCheck = true;
    });
  }

  onNameCheck(String name) {
    setState(() {
      if (name.isNotEmpty) {
        _hasNameCheck = true;
      } else {
        _hasNameCheck = false;
      }
    });
  }

  onFamilyNameCheck(String name) {
    setState(() {
      if (name.isNotEmpty) {
        _hasFamilyNameCheck = true;
      } else {
        _hasFamilyNameCheck = false;
      }
    });
  }

  onNoofdocCheck(String doc) {
    setState(() {
      if (doc.isNotEmpty) {
        _hasNoOfDocCheck = true;
      } else {
        _hasNoOfDocCheck = false;
      }
    });
  }

  onOptionalCheck(String op) {
    setState(() {
      if (op.isNotEmpty) {
        _hasOptinalCheck = true;
      } else {
        _hasOptinalCheck = false;
      }
    });
  }

  onPhoneCheck(String phone) {
    bool phoneNumber = DefaultValue.phoneRegExp.hasMatch(phone);

    setState(() {
      _hasValidNumberCheck = false;
      if (phoneNumber) _hasValidNumberCheck = true;
    });
  }
}
