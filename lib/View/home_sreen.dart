import 'dart:convert';

import 'package:currency_converter/Controller/drop_down_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';

import '../instance.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController amount = TextEditingController();
  String date = '';
  String targetCurrencyValue = '';
  String totalValue = '';

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF1EEE2),
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
                    controller: amount,
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
                const Text("Password"),
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
                                    dropDownController.update();
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
                                    dropDownController.update();
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
                          //
                          var result = await apiFunctions.exchangeCurrencies(
                              dropDownController.value.toString(),
                              dropDownController.value2.toString());
                          //
                          var conversionData = jsonDecode(result);
                          //
                          targetCurrencyValue = conversionData[
                                  dropDownController.value2?.toLowerCase()]
                              .toString();
                          //
                          totalValue = (double.parse(amount.text) *
                                  double.parse(targetCurrencyValue))
                              .toString();
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
                  padding: EdgeInsets.only(left: 20),
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
                      const Text("Result:",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
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
                          Text(
                            '$targetCurrencyValue ${dropDownController.value2}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${amount.text} ${dropDownController.value.toString().toUpperCase()}',
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
                          Text(
                            '$totalValue ${dropDownController.value2.toString().toUpperCase()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
