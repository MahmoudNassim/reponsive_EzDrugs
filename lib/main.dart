import 'package:app01/Constant/color.dart';
import 'package:app01/View/Screens/Cart.dart';
import 'package:app01/View/Screens/ForgetPassword.dart';
import 'package:app01/View/Screens/HomeScreen.dart';
import 'package:app01/View/Screens/Login.dart';
import 'package:app01/View/Screens/Register.dart';
import 'package:app01/View/Screens/changePassword.dart';
import 'package:app01/View/Screens/onBording.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        LoginScreen.RouteName: (context) => LoginScreen(),
        RegisterL.RouteName: (context) => RegisterL(),
        HomeScreen.RouteName: (context) => HomeScreen(),
        onBording.RouteName: (context) => onBording(),
        ForgetPassword.RouteName: (context) => ForgetPassword(),
        changePassword.RouteName: (context) => changePassword(),
      },
      home: AnimatedSplashScreen(
          splash: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image(image: AssetImage('Assets/Images/E5.png'),fit: BoxFit.fill,)),
                Expanded(child: Text('EzDrugs', style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColor.splashText) ,))
              ],
            ),
          ),
          duration: 3000,
          nextScreen: LoginScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}

