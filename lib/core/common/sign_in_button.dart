import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:reddit/core/constants/constants.dart";
import 'package:phlox_animations/phlox_animations.dart';
import "package:reddit/features/auth/controller/auth_controller.dart";
import "package:reddit/theme/pallete.dart";

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  void signInWithGoogle(BuildContext context, WidgetRef ref) {
    ref.read(AuthControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: PhloxAnimations(
        duration: const Duration(seconds: 1),
        fromDegrees: 40,
        fromOpacity: 0,
        fromScale: 0,
        fromX: 100,
        fromY: -100,
        child: ElevatedButton.icon(
          onPressed: () => signInWithGoogle(context, ref),
          icon: Image.asset(
            Constants.googlePath,
            width: 35,
          ),
          label: const Text(
            "Continue with Google",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }
}
