import 'package:conoce_beta/presentation/home/pages/narrow_home.dart';
import 'package:conoce_beta/presentation/home/pages/wide_home.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.sizeOf(context).width;
    if (sizeWidth > 600) {
      // Tablet y/p Computer
      return const WideHome();
    } else {
      // Mobile Device
      return const NarrowHome();
    }
  }
}
