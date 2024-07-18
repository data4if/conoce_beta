import 'package:conoce_beta/presentation/home/pages/table_home.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.sizeOf(context).width;
    //print("Size of the screen => " + sizeWidth.toString());
    if (sizeWidth > 600) {
      return const TestHome();
    } else {
      //return const MobileHome();
      return const TestHome();
    }
  }
}
