import 'package:currency_converter/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> Currencies = [];
    String from = '';
    String? to;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
              customDropDown(Currencies, from, (from) {}),
              // TextField(
              //   onChanged: (value) {
              //     //Do something with the user input.
              //   },
              //   decoration: const InputDecoration(
              //     labelText: 'Source currency', contentPadding:
              //   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black, width: 1.0),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.black, width: 2.0),
              //     ),
              //   ),
              // ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  //filled: true,
                  labelText: 'Target Currency',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
              Divider(
                thickness: 1.sp,
                color: Colors.grey,
              ),
              Text(
                'Result :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '1 rupee',
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
                    '80 US dollar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // <-- Radius
                      ),
                    ),
                    onPressed: () async {},
                    child: const Text('view previous conversion'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

