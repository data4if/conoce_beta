import 'package:conoce_beta/presentation/home/pages/mobile_home.dart';
import 'package:conoce_beta/presentation/home/pages/web_home.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.sizeOf(context).width;
    //print("Size of the screen => " + sizeWidth.toString());
    if (sizeWidth > 600) {
      return const WebHome();
    } else {
      return const MobileHome();
    }
  }
}
