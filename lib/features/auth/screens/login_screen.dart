import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit/core/common/loader.dart';
import 'package:reddit/features/auth/controller/auth_controller.dart';
import '../../../core/common/sign_in_button.dart';
import "../../../core/constants/constants.dart";
import 'package:phlox_animations/phlox_animations.dart';

import 'splash_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(AuthControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            Constants.logoPath,
            height: 40,
            alignment: Alignment.center,
          ),
          actions: [
            PhloxAnimations(
              duration: const Duration(seconds: 1),
              fromDegrees: 30,
              fromOpacity: 0,
              fromX: 0,
              fromY: -100,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  },
                  child: const Text("next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))),
            )
          ],
        ),
        body: isLoading
            ? const Loader()
            : Column(children: [
                const SizedBox(height: 30),
                const PhloxAnimations(
                    duration: Duration(seconds: 1),
                    fromX: 23,
                    fromOpacity: 0,
                    child: Text("Dive into anything",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ))),
                const SizedBox(height: 30),
                PhloxAnimations(
                    duration: const Duration(seconds: 1),
                    fromDegrees: 0,
                    fromX: 0,
                    fromOpacity: 0,
                    fromY: -100,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Constants.loginEmotePath,
                          height: 400,
                        ))),
                const SizedBox(height: 20),
                const SignInButton()
              ]));
  }
}
