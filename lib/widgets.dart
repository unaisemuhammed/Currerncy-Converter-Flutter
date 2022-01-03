import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'Controller/currency_fetching.dart';
import 'colors.dart'as colors;
import 'Controller/drop_down_controller.dart';
import 'instance.dart';

Widget amountTextField() => Container(
      decoration: BoxDecoration(
          color:  colors.textFieldColor,
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
        controller: amount,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Amount",
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );


//Dropdown
Widget dropDownWidget() =>Container(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  decoration: BoxDecoration(
      color:  colors.textFieldColor,
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
            items: Keys.map(dropDownController.buildMenuItem)
                .toList(),
            onChanged: (value) {
              dropDownController.value = value;
              controller.update();
            },
          ),
        );
      }),
);

//DropDown2
Widget dropDownTwoWidget() =>  Container(
  padding: const EdgeInsets.symmetric(horizontal: 15),
  decoration: BoxDecoration(
      color:  colors.textFieldColor,
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
            items: Keys.map(dropDownController.buildMenuItem)
                .toList(),
            onChanged: (value) {
              dropDownController.value2 = value;
              controller.update();
            },
          ),
        );
      }),
);

//ButtonWidget
Widget buttonWidget() => Container(
    padding: const EdgeInsets.all(15.0),
    child:  Center(
        child: Text(
          "Convert",
          style:
          TextStyle(color: Colors.white, fontSize: 16.sp),
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
        ]),
  );

//ResultWidget
Widget resultWidget() =>  Container(
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
              '${targetCurrencyValue} ${dropDownController.value2}',
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
            '${amount.text == '' ? '1' : amount.text} ${dropDownController.value.toString().toUpperCase()}',
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
              '${totalValue} ${dropDownController.value2.toString().toUpperCase()}',
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
);

