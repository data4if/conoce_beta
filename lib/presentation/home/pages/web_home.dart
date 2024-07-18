import 'dart:async';
import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 270,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Image.asset(
            "images/brand/fomutur.png", // Corregida la ruta de la imagen
            width: 270,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
        toolbarHeight: 83.00,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: InkWell(
                child: const Text(
                  '¿Quiénes somos?',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 20.0,
                    fontFamily: 'alcaldia_fonts',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onTap: () {
                  print('Quienes somos');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              onPressed: () {
                print('Persona perfil');
              },
              iconSize: 30.0,
              color: AppTheme.primaryColor,
              icon: const Icon(Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
            child: IconButton(
              onPressed: () {
                print('Persona ayuda');
              },
              iconSize: 30.0,
              color: AppTheme.primaryColor,
              icon: const Icon(Icons.help),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MainPage(),
            AspectRatio(
              aspectRatio: 9 / 1.2, // Ajusta según la proporción que desees
              child: Container(
                color: Colors.white,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '!Te presentamos lo nuestro!',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 20.0,
                          fontFamily: 'alcaldia_fonts',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                          'Conoce la ciudad y historia !Desde cualquier parte del mundo!',
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 20.0,
                            fontFamily: 'alcaldia_fonts',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<String> _imageList = [
    'assets/images/main/main_1.jpeg',
    'assets/images/main/main_2.jpeg',
    'assets/images/main/main_3.jpeg',
  ];

  void startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageList.length;
        });
      }
      startTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: AspectRatio(
            aspectRatio: 9 / 5, // Ajusta según la proporción que desees
            child: Image.asset(
              _imageList[_currentIndex],
              fit: BoxFit.cover,
              key: ValueKey(_imageList[_currentIndex]),
            ),
          ),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        AspectRatio(
          aspectRatio: 5.7 / 2.2, // Ajusta según la proporción que desees
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "images/brand/conoce.png", // Corregida la ruta de la imagen
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
