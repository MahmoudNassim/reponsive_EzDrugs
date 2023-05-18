// import 'package:app01/View/Screens/Login.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class BoardingModel {
//   final String image;
//   final String title;
//   final String body;

//   BoardingModel({required this.image, required this.title, required this.body});
// }

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var boardingController = PageController();

//     List<BoardingModel> boarding = [
//       BoardingModel(
//           image: 'assets/images/1.png',
//           title: 'Smart Pharmacy System',
//           body:
//               " Our team works to ensure that the doctors and pharmacists become available in the shortest possible time."),
//       BoardingModel(
//           image: 'assets/images/2.png',
//           title: 'Order your medicines',
//           body:
//               "Make sure you understand exactly how to take your medicines before you leave the pharmacy."),
//       BoardingModel(
//           image: 'assets/images/3.png',
//           title: 'Faster healthcare',
//           body:
//               "Alarm bills should ring if an online pharmacy is happy to supply you without medical assessment, or without asking you to provide a prescription from your doctor.")
//     ];

//     bool isLast = false;

//     void submit() {
//       CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
//         if (value!) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>  LoginScreen()),
//               (Route<dynamic> route) => false);
//         }
//       });
//     }

//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Scaffold(
//         body: SafeArea(
//             child: Column(
//       children: [
//         Expanded(
//             child: PageView.builder(
//           onPageChanged: (int index) {
//             if (index == 2) {
//               setState(() {
//                 isLast = true;
//               });
//             }
//           },
//           physics: const BouncingScrollPhysics(),
//           controller: boardingController,
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(12.0),
//                   topRight: Radius.circular(12.0),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Column(
//                     children: [
//                       Image(
//                         image: AssetImage(boarding[index].image),
//                         //fit: BoxFit.cover,
//                         width: width,
//                         height: height * 0.5,
//                       ),
//                     ],
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12.0),
//                       color: const Color(0xFF272743),
//                     ),
//                     padding: const EdgeInsets.only(
//                       top: 16.0,
//                       right: 20.0,
//                       left: 20.0,
//                       bottom: 16.0,
//                     ),
//                     height: height * 0.398,
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         top: 10,
//                         left: 10,
//                         right: 10,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           // const SizedBox(
//                           //   height: 1.0,
//                           // ),
//                           Text(
//                             boarding[index].title,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 22.0,
//                               height: 1.25,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           Text(
//                             boarding[index].body,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18.0,
//                               //height: 1.25,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const Spacer(),
//                           SmoothPageIndicator(
//                             controller: boardingController,
//                             count: boarding.length,
//                             effect: const ExpandingDotsEffect(
//                               dotColor: Colors.white,
//                               activeDotColor: Colors.white,
//                               dotHeight: 8,
//                               dotWidth: 8,
//                               spacing: 5.0,
//                               expansionFactor: 4,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30.0,
//                           ),
//                           SizedBox(
//                             height: 40,
//                             width: 275,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushAndRemoveUntil(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                              LoginScreen()),
//                                     (Route<dynamic> route) => false);
//                               },
//                               style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ))),
//                               child: const Text(
//                                 'Get Started',
//                                 style: TextStyle(
//                                     color: Color(0xFF272743),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           itemCount: boarding.length,
//         )),
//       ],
//     )));
//   }
// }
