import 'package:dice_app/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String message) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: message,
      backgroundColor: Colors.amber, 
      borderRadius: 10, 
      margin: const EdgeInsets.all(8), 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
      duration: const Duration(seconds: 3), 
      titleText: Text(
        title,
        style: const TextStyle(fontSize: AppSizes.fontSizeMd, 
        fontWeight: FontWeight.bold, 
        color: Colors.black), 
      ),
      messageText: Text(
        message,
        style: const TextStyle(fontSize: AppSizes.fontSizeMs, 
        color: Colors.black), 
      ),
    ),
  );
}
