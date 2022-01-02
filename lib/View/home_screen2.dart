import 'dart:convert';
import 'package:currency_converter/Model/conversion_handler.dart';
import 'package:currency_converter/colors.dart'as colors;
import 'package:currency_converter/Controller/drop_down_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

import '../instance.dart';
import 'conversions_history.dart';

class HomeScreen2 extends StatefulWidget {
  HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

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
                const Text(
                  "MONEY CONVERTER",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text("Enter Amount"),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFFEFF3F6),
                      borderRadius: BorderRadius.circular(100.0),
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
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: apiFunctions.amount,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Amount",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const Text("Select currency"),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: const Color(0XFFEFF3F6),
                            borderRadius: BorderRadius.circular(100.0),
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
                        child: GetBuilder<DropDownController>(
                            init: DropDownController(),
                            builder: (controller) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropDownController.value,
                                  items: apiFunctions.Keys.map(buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    dropDownController.value = value;
                                    controller.update();
                                  },
                                ),
                              );
                            }),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          'assets/icons/image.png',
                          scale: 10,
                          color: Colors.blue,
                        )),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: const Color(0XFFEFF3F6),
                            borderRadius: BorderRadius.circular(100.0),
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
                        child: GetBuilder<DropDownController>(
                            init: DropDownController(),
                            builder: (controller) {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropDownController.value2,
                                  items: apiFunctions.Keys.map(buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    dropDownController.value2 = value;
                                    controller.update();
                                  },
                                ),
                              );
                            }),
                      ),
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
                          var result = await apiFunctions.exchangeCurrencies(
                              dropDownController.value.toString(),
                              dropDownController.value2.toString());

                          //decodingToJson
                          var conversionData = jsonDecode(result);

                          //gettingTargetCurrencyValue
                          apiFunctions.targetCurrencyValue = conversionData[
                                  dropDownController.value2?.toLowerCase()]
                              .toString();

                          //gettingTotalValue
                          apiFunctions.totalValue = (double.parse(
                                      apiFunctions.amount.text == ''
                                          ? '1'
                                          : apiFunctions.amount.text) *
                                  double.parse(
                                      apiFunctions.targetCurrencyValue))
                              .toString();
                          String history="${apiFunctions.amount.text.toString()}   ${dropDownController.value}    =    ${apiFunctions.totalValue.toString()}   ${dropDownController.value2!}";
                         dataBaseController.addCurrencyHistories(historyValue:history, dateTime:conversionData['date'].toString());
                          //Database
                     //     dataBaseController.addStudents(targetCurrency: '', amountValue: '', sourceCurrency: '', totalTargetValue: '')
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: const Center(
                              child: Text(
                            "Convert",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          )),
                          decoration: BoxDecoration(
                              color: const Color(0XFFC41760),
                              borderRadius: BorderRadius.circular(100.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0XFFC41760),
                                    offset: Offset(6, 2),
                                    blurRadius: 1.0,
                                    spreadRadius: 2.0),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: 100.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: const Color(0XFFEFF3F6),
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
                      const Text(
                        "Result:",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
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
                              '${apiFunctions.targetCurrencyValue} ${dropDownController.value2}',
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
                            '${apiFunctions.amount.text == '' ? '1' : apiFunctions.amount.text} ${dropDownController.value.toString().toUpperCase()}',
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
                              '${apiFunctions.totalValue} ${dropDownController.value2.toString().toUpperCase()}',
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
               TextButton(onPressed: (){Get.to(const ConversionHistoryScreen());}, child: const Text('History')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
