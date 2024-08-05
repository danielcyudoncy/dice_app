import 'package:dice_app/utils/constant/sizes.dart';
import 'package:dice_app/utils/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dice_controller.dart';

class DiceScreen extends StatelessWidget {
  DiceScreen({super.key});

  final DiceController diceController = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName, 
          style: TextStyle(fontSize: AppSizes.fontSizeLg),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              String assetPath = 'assets/images/one.png';
              switch (diceController.dice.value.number) {
                case 1:
                  assetPath = 'assets/images/one.png';
                  break;
                case 2:
                  assetPath = 'assets/images/two.png';
                  break;
                case 3:
                  assetPath = 'assets/images/three.png';
                  break;
                case 4:
                  assetPath = 'assets/images/four.png';
                  break;
                case 5:
                  assetPath = 'assets/images/five.png';
                  break;
                case 6:
                  assetPath = 'assets/images/six.png';
                  break;
              }
              return Image.asset(
                assetPath,
                width: 150,
                height: 150,
              );
            }),
            const SizedBox(height: 20),
            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: diceController.rollDice,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.blue, 
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: AppSizes.fontSizeLg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
