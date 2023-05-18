import 'dart:convert';

import 'package:app01/Constant/color.dart';
import 'package:app01/View/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterL extends StatefulWidget {
  static const RouteName = 'RegisterL';

  @override
  State<RegisterL> createState() => _RegisterLState();
}

class _RegisterLState extends State<RegisterL> {
  final String _Url = 'https://api.ezdrug.tech/Account/Register';

  final _formKey = GlobalKey<FormState>();

  var ConfirmpasswordController = TextEditingController();

  var firstName = TextEditingController();
  var lastName = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  Future<void> registerAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse('https://api.ezdrug.tech/Account/Register');
    final body = jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful!');

        // Navigate to home screen
        Get.offAllNamed(HomeScreen.RouteName);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Account created successfully!'),
          duration: Duration(seconds: 3),
        ));
      } else {
        // Registration failed
        print('Registration failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Handle the error
      print('Error registering account: $e');
    }
  }

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
          'Sign Up ',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 1,
              color: AppColor.white,
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                        'Assets/Images/sign.PNG',
                        fit: BoxFit.cover,
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),

                      //First Name
                      TextFormField(
                        controller: firstName,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      //Last Name
                      TextFormField(
                        controller: lastName,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),

                      //EmailAddress
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      //PAssword
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      // Confirm Password
                      TextFormField(
                        controller: ConfirmpasswordController,
                        obscureText: !_confirmPasswordVisible,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                            child: Icon(
                              _confirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {
                                      registerAccount(
                                        firstName: firstName.text,
                                        lastName: lastName.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        confirmPassword:
                                            ConfirmpasswordController.text,
                                      );
                                    },
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.primaryButtonColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ))),
                                    child: const Text(
                                      'Sign UP',
                                      style: TextStyle(
                                          color: AppColor.white, fontSize: 20),
                                    )),
                              ))
                    ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}
