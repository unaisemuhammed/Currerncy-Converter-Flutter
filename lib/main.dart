import 'package:currency_converter/View/conversion_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
            canvasColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
            )),
        home:  ConversionScreen(),
      );
    });
  }
}
