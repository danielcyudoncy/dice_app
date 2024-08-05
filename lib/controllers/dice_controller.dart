import 'dart:math';

import 'package:dice_app/customSnackbar/show_custom_snackbar.dart';
import 'package:dice_app/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceController extends GetxController {
  var dice = DiceModel().obs;

  void rollDice() {
  if (dice.value.rollCount < dice.value.maxRolls) {
    int rolledNumber = Random().nextInt(6) + 1;

   
    dice.update((model) {
      if (model != null) {
        model.number = rolledNumber;
        model.rollCount += 1;
        model.totalSum += rolledNumber;
        model.rollResults.add(rolledNumber);
      }
    });

    
    if (rolledNumber == 6) {
      showCustomSnackbar('Dice Roll', 'A 6 has been thrown');
    } else if (rolledNumber % 2 == 0) {
      showCustomSnackbar('Dice Roll', 'An even number has been thrown');
    } else {
      showCustomSnackbar('Dice Roll', 'An odd number has been thrown');
    }
  }

  if (dice.value.rollCount == dice.value.maxRolls) {
    Get.snackbar(
      'Dice Rolled',
      'Roll Results: ${dice.value.rollResults.join(', ')}',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
    resetGame();
  }
}

  void resetGame() {
    dice.update((model) {
      if (model != null) {
        model.number = 1;
        model.rollCount = 0;
        model.totalSum = 0;
        model.rollResults = []; 
      }
    });
  }
}
