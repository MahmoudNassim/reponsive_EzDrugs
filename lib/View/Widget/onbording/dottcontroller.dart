import 'package:app01/Controller/onBording_Controller.dart';
import 'package:app01/Data/DtaSource/Static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constant/color.dart';

class CustomDottControllrtonBording extends StatelessWidget {
  const CustomDottControllrtonBording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBordingControllerImp>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBordingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 3),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage==index ? 20: 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(20)),
                        ))
              ],
            )));
  }
}
