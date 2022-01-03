import 'package:currency_converter/Controller/drop_down_controller.dart';
import 'package:flutter/material.dart';
import 'package:currency_converter/colors.dart'as colors;
import 'package:get/get.dart';

import '../../instance.dart';
class DropDownContainer extends StatelessWidget {
  const DropDownContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DropDownWidget
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: colors.textFieldColor,
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
                      items: getCurrencies.currenciesList
                          .map(dropDownController.buildMenuItem)
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
          ),
        ),
        //DropDownWidget
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: colors.textFieldColor,
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
                      items: getCurrencies.currenciesList
                          .map(dropDownController.buildMenuItem)
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
    );
  }
}