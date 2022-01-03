import 'dart:convert';
import 'package:currency_converter/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../instance.dart';
import '../widgets.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                amountTextField(),
                SizedBox(
                  height: 3.h,
                ),
                Text("Select currency", style: TextStyle(fontSize: 10.sp)),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    //DropDownWidget
                    Expanded(
                      child: dropDownWidget(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        'assets/icons/image.png',
                        scale: 10,
                        color: Colors.blue,
                      ),
                    ),
                    //DropDownWidget
                    Expanded(
                      child: dropDownTwoWidget(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () async {
                            //functionCalling
                            var result =
                                await exchangeRateCurrency.exchangeRateCurrencies(
                                    dropDownController.value.toString(),
                                    dropDownController.value2.toString());

                            //decodingToJson
                            var conversionData = jsonDecode(result);

                            //gettingTargetCurrencyValue
                            totalController.targetCurrencyValue = conversionData[
                                    dropDownController.value2?.toLowerCase()]
                                .toString();

                            //gettingTotalValue
                            totalController.totalValue = (double.parse(
                                totalController. amount.text == '' ? '1' : totalController.amount.text) *
                                    double.parse(totalController.targetCurrencyValue))
                                .toString();
                            String history =
                                "${totalController.amount.text.toString()}   ${dropDownController.value}    =    ${totalController.totalValue.toString()}   ${dropDownController.value2!}";

                            //AddToDatabase
                            dataBaseController.addCurrencyHistories(
                                historyValue: history,
                                dateTime: conversionData['date'].toString());
                            setState(() {});
                          },
                          child: buttonWidget()),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                //ResultWidget
                resultWidget(),
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
    );
  }
}
