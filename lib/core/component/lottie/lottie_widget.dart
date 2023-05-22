import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  final String path;
  const LottieWidget({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset("assets/lottie/$path.json");
  }
}
