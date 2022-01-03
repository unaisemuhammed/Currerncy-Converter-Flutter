import 'package:currency_converter/View/HomeSceen/text_field.dart';
import 'package:currency_converter/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../HistoryScreen/history_screen.dart';
import 'button.dart';
import 'drop_down.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: colors.backgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "MONEY CONVERTER",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("Enter Amount", style: TextStyle(fontSize: 10.sp)),
                  SizedBox(
                    height: 3.h,
                  ),

                  //AmountTextField
                  const TextFieldContainer(),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text("Select currency", style: TextStyle(fontSize: 10.sp)),
                  SizedBox(
                    height: 3.h,
                  ),

                  //DropDownClass
                  const DropDownContainer(),
                  SizedBox(
                    height: 10.h,
                  ),

                  //ButtonContainer and Result
                  const ButtonContainer(),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Get.to(const ConversionHistoryScreen());
                          },
                          child: Text('History',
                              style: TextStyle(fontSize: 10.sp)))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
