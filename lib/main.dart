import 'package:app01/Constant/color.dart';
import 'package:app01/Dr/LoginDr.dart';
import 'package:app01/Dr/RegisterDr.dart';
import 'package:app01/View/Screens/ForgetPassword.dart';
import 'package:app01/View/Screens/HomeScreen.dart';
import 'package:app01/View/Screens/Login.dart';
import 'package:app01/View/Screens/Register.dart';
import 'package:app01/View/Screens/changePassword.dart';
import 'package:app01/View/Screens/onBording.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';

import 'Dr/HomeScreenDr.dart';

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
        HomeScreen.RouteName: (context) => const HomeScreen(),
        HomeScreenDr.RouteName: (context) => HomeScreenDr(),
        onBording.RouteName: (context) => onBording(),
        ForgetPassword.RouteName: (context) => ForgetPassword(),
        changePassword.RouteName: (context) => changePassword(),
        RegisterDr.RouteName: (context) => RegisterDr(),
       LoginDr.RouteName: (context) => LoginDr(),
      },
      home: AnimatedSplashScreen(
          splash: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 42,
                child: Column(
                  children: const [
                    Expanded(
                        child: Image(
                      image: AssetImage('Assets/Images/E5.png'),
                      fit: BoxFit.fill,
                    )),
                    Expanded(
                        child: Text(
                      'EzDrugs',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.splashText),
                    ))
                  ],
                ),
              ),
            ]),
          ),
          duration: 3000,
          nextScreen: onBording()),
      debugShowCheckedModeBanner: false,
    );
  }
}
