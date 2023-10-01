import 'package:app01/Constant/color.dart';
import 'package:app01/View/Screens/HomeScreen.dart';
import 'package:app01/View/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app01/Dr/RegisterDr.dart';
import 'package:app01/Dr/LoginDr.dart';

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(60),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.RouteName);
                    },
                    child: Image.asset("Assets/Images/customer.PNG")),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginDr.RouteName);
                    },
                     child: Image.asset("Assets/Images/Dr.PNG")),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Image.asset("Assets/Images/photo.PNG"),
          ),
        ],
      )),
    );
  }
}
