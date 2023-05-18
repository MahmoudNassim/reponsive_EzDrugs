import 'package:app01/Constant/color.dart';
import 'package:app01/Controller/onBording_Controller.dart';
import 'package:app01/View/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtononBording extends GetView<onBordingControllerImp> {
  const CustomButtononBording({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        child: const Text(
          'Continue',
          style: TextStyle(color: AppColor.black),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ))),
      ),
    );
  }
}
