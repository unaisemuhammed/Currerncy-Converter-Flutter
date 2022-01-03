import 'package:currency_converter/Model/conversion_handler.dart';
import 'package:currency_converter/Model/conversion_history_model.dart';
import 'package:currency_converter/instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ConversionHistoryScreen extends StatefulWidget {
  const ConversionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ConversionHistoryScreen> createState() =>
      _ConversionHistoryScreenState();
}

class _ConversionHistoryScreenState extends State<ConversionHistoryScreen> {
  RetrieveData? retrieveData;

  @override
  void initState() {
    retrieveData =RetrieveData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Conversion',
          style: TextStyle(color: Colors.black, fontSize: 14.sp),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          TextButton(
              onPressed: ()  {
                dataBaseController.clearAllData();
                setState(() {});
              },
              child: Text('Clear',
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900)))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 18.sp),

        //ListOfHistory
        child: FutureBuilder(
          future: retrieveData?.retrieveCurrencyData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ConversionModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
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
                        child: ListTile(
                          title: Text(
                            snapshot.data![index].historyValue,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            snapshot.data![index].dateTime,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp),
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              dataBaseController
                                  .deleteHistoryData(snapshot.data![index].id!);
                              setState(() {});
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: Color(0XFFC41760)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
