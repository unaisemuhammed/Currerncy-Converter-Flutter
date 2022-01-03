import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackBar() => Get.snackbar(
      'Something went wrong',
      'Check your internet connection',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      icon: const Icon(
        CupertinoIcons.wifi_slash,
        color: Colors.white,
      ),
    );

SnackbarController validationSnackBar() => Get.snackbar(
  'Something went wrong',
  'Enter an amount to convert',
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.black87,
  colorText: Colors.white,
  icon: const Icon(
    CupertinoIcons.xmark_circle,
    color: Colors.white,
  ),
);
