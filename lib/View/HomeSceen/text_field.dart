import 'package:flutter/material.dart';
import 'package:currency_converter/colors.dart' as colors;

import '../../instance.dart';
import '../../widget.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        keyboardType: TextInputType.number,
        controller: amountController.amount,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Amount",
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
