import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ConversionHistoryScreen extends StatelessWidget {
  const ConversionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text('My Conversion',style: TextStyle(color: Colors.black,fontSize: 14.sp),),
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () { Get.back(); },),
      ),
      body: Padding(
          padding:  EdgeInsets.only(top: 18.sp),
          child: ListView.separated(
            itemCount: 25,
            separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,),
            itemBuilder: (BuildContext context, int index) {
              return  ListTile(
                title:  Padding(
                  padding: EdgeInsets.only(bottom: 15.sp),
                  child:Text('13/07/2021',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 12.sp),),
                ),
                subtitle:  Padding(
                  padding:  EdgeInsets.only(bottom: 20.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:   [
                      Text('1 rupee',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14.sp,color: Colors.black),),
                      SizedBox(width: 10.w,),
                      Text('=',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14.sp,color: Colors.black),),
                      SizedBox(width: 10.w,),
                      Text('80 US dollar',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14.sp,color: Colors.black),),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
