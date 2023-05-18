import 'package:app01/Data/DtaSource/Static.dart';
import 'package:app01/View/Screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class onBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBordingControllerImp extends onBordingController {
  late PageController pageController;

  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onBordingList.length - 1) {
        Get.offAllNamed(LoginScreen.RouteName);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
