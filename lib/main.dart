import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// TODO agregar la configuracion de dependencias
double height_bar = 99.0;
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// TODO para probar con el emulador await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 170.0,
          leading: Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 5,
              bottom: 5,
            ),
            alignment: Alignment.centerLeft,
            child: const Image(
              width: double.infinity,
              height: double.infinity,
              image: AssetImage('assets/images/logos/fomutur.png'),
            ),
          ),
          toolbarHeight: AppTheme.realToLogicalPixels(
            realPixels: 83,
            deviceRatio: MediaQuery.of(context).devicePixelRatio,
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
