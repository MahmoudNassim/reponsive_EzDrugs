import 'package:app01/Controller/onBording_Controller.dart';
import 'package:app01/Data/DtaSource/Static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/CustomButton.dart';
import '../Widget/onbording/dottcontroller.dart';

class onBording extends GetView<onBordingControllerImp> {
  static const RouteName = 'onBording';

  @override
  Widget build(BuildContext context) {
    Get.put(onBordingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (val){
                    controller.onPageChanged(val);
                },
                  itemCount: onBordingList.length,
                  itemBuilder: (context, i) => Center(
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  onBordingList[i].Image!,
                                  width: 400,
                                  height: 350,
                                  fit: BoxFit.fill,
                                )),
                            const SizedBox(
                              height: 90,
                            ),
                            Container(
                                width: double.infinity,
                                height: 350,
                                color: const Color(0xFF272743),
                                child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          onBordingList[i].Body!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 23,
                                              height: 1.25),
                                        ),
                                        const SizedBox(height: 35),
                                        const CustomDottControllrtonBording(),
                                        const Spacer(),
                                       const CustomButtononBording()
                                      ],
                                    ))),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
    ));
  }
}
