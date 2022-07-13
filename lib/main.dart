import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_form/view/forms/form_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('es')],
    path: 'assets/langs', // <-- change the path of the translation files
    fallbackLocale: Locale('en'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final appdata = GetStorage();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    context.setLocale(Locale('es'));

    return MaterialApp(
      title: 'App Name'.tr(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const FormPage(),
    );
  }
}
