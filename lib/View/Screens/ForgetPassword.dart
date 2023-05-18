import 'package:app01/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgetPassword extends StatelessWidget {
  static const RouteName = 'Forget Password';
  var emailController = TextEditingController();

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
          'Forget Password ',
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
                      'Assets/Images/Login.png',
                      width: MediaQuery.of(context).size.width * 1.2,
                      height: MediaQuery.of(context).size.height * .4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),

                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "We will send a mail to \n the email address you registered \n to regain the password ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  //Email Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          labelText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.02,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Send',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(AppColor.primaryButtonColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
