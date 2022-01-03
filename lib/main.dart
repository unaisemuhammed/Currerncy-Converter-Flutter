import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:currency_converter/colors.dart' as colors;
import 'View/HomeSceen/home_screen.dart';
import 'instance.dart';

void main() async{
 await getCurrencies.getAllCurrencies();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            canvasColor: colors.backgroundColor,
            appBarTheme: const AppBarTheme(
              color: colors.backgroundColor,
            )),
        home: const HomeScreen(),
      );
    });
  }
}
