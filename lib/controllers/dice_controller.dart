import 'dart:async';
import 'dart:math';
import 'package:dice_app/models/dice_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';

class DiceController extends GetxController {
  var dice = DiceModel(number: 1, rollCount: 0).obs;
  int totalSum = 0; 

  void rollDice() {
    int newNumber = Random().nextInt(6) + 1;
    dice.update((val) {
      val?.number = newNumber;
      val?.rollCount++;
    });

    
    totalSum += newNumber;

    Future.microtask(() {
      _showToast(newNumber);
    });

    _checkRollCount();
  }

  void _showToast(int number) {
    String message;
    if (number == 6) {
      message = 'A 6 has been thrown';
    } else if (number % 2 == 0) {
      message = 'An even number is thrown';
    } else {
      message = 'An odd number is thrown';
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 20.0,
    );
  }

  void _checkRollCount() {
    if (dice.value.rollCount == 6) {
        dice.update((val) {
        val?.rollCount = 0;
      });

      
      Future.delayed(const Duration(seconds: 3), () {
        Fluttertoast.showToast(
          msg: 'Total sum of numbers: $totalSum',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

      
        totalSum = 0;
      });
    }
  }
}
