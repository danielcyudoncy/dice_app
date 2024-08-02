import 'package:dice_app/screens/dice_screen.dart';
import 'package:dice_app/utils/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: DiceScreen(),
    );
  }
}

