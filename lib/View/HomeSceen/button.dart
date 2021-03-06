import 'dart:convert';
import 'package:currency_converter/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../instance.dart';

class ButtonContainer extends StatefulWidget {
  const ButtonContainer({Key? key}) : super(key: key);

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
@override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
             FocusScope.of(context).unfocus();
            //validating amount field
            amountController.customTextFieldValidation();
            //functionCalling
            var result = await exchangeRateCurrency.exchangeRateCurrencies(
                dropDownController.value.toString(),
                dropDownController.value2.toString());

            //decodingToJson
            var conversionData = jsonDecode(result);

            //gettingTargetCurrencyValue
            totalController.targetCurrencyValue =
                conversionData[dropDownController.value2?.toLowerCase()].toString();

            //gettingTotalValue
            totalController.totalValue = (double.parse(
                amountController.amount.text == ''
                    ? '1'
                    : amountController.amount.text) *
                double.parse(totalController.targetCurrencyValue))
                .toString();
            String history =
                "${amountController.amount.text.toString() == '' ? '1' : amountController.amount.text.toString()}   ${dropDownController.value}    =    ${totalController.totalValue.toString()}   ${dropDownController.value2!}";

            //AddToDatabase
            dataBaseController.addCurrencyHistories(
                historyValue: history, dateTime: conversionData['date'].toString());

            setState(() {});

          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Text(
              "Convert",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            )),
            decoration: BoxDecoration(
              color: colors.buttonColor,
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: const [
                BoxShadow(
                    color: Color(0XFFC41760),
                    offset: Offset(6, 2),
                    blurRadius: 1.0,
                    spreadRadius: 2.0),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        //ButtonContainer
        Container(
          padding: const EdgeInsets.only(left: 20),
          width: 100.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: colors.textFieldColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0),
                BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Result:",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    '1 ${dropDownController.value.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      '${totalController.targetCurrencyValue} ${dropDownController.value2}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${amountController.amount.text == '' ? '1' : amountController.amount.text} ${dropDownController.value.toString().toUpperCase()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      '${totalController.totalValue} ${dropDownController.value2.toString().toUpperCase()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
