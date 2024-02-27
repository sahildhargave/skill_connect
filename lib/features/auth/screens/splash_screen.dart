import '../../../Constant File/pallete.dart';

import "package:flutter/material.dart";
//
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phlox_animations/phlox_animations.dart';

import '../../../String Files/text_string.dart';
import '../../../Ui/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.whiteColor,
        body: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PhloxAnimations(
                      duration: const Duration(seconds: 2),
                      fromDegrees: 90,
                      fromScale: 100,
                      fromOpacity: 0.6,
                      //fromY: -100,
                      fromX: 100,
                      child: Text(
                        flex,
                        style: TextStyle(
                          color: Pallete.blackColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 45),
                    PhloxAnimations(
                        duration: const Duration(seconds: 2),
                        fromDegrees: 40,
                        fromScale: 0,
                        fromOpacity: 0.1,
                        fromX: 100,
                        child: Text(easyFindjob,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Pallete.blackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(height: 25),
                    Text(flex_sub,
                        style: TextStyle(
                          color: Pallete.greyColor,
                          fontSize: 18,
                        )),
                    PhloxAnimations(
                        duration: const Duration(seconds: 1),
                        fromY: -100,
                        child: Image.asset(
                          "assets/splash_screen_img1.gif",
                          height: 350,
                        )),
                    SizedBox(height: 30),
                    PhloxAnimations(
                        duration: const Duration(seconds: 2),
                        fromY: -100,
                        child: SizedBox(
                          height: 48,
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnbordingScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Pallete.blackColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(Get_Started,
                                style: TextStyle(
                                  color: Pallete.borderColor,
                                  fontSize: 15,
                                )),
                          ),
                        ))
                  ]),
            )));
  }
}
