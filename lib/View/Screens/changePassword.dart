import 'package:app01/Constant/color.dart';
import 'package:app01/View/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';


class changePassword extends StatelessWidget {
  static const RouteName = 'Change Password';
  var oldPasswordcontroller = TextEditingController();
  var newPasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Change Password ',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Container(
                  color: AppColor.primaryAppColor,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    alignment: Alignment.center,
                    color: AppColor.white,
                    child: Image.asset(
                      'Assets/Images/CPassword.png',
                      width: 340,
                      height: 350,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  //old Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: oldPasswordcontroller,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Old Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: oldPasswordcontroller,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'new Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: oldPasswordcontroller,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),                  

                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context,HomeScreen.RouteName);
                        },
                        child: const Text(
                          'Save Now !',
                          style: TextStyle(color: AppColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          )),
    );
  }
}
