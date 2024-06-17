import 'dart:async';

import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WideHome extends StatelessWidget {
  const WideHome({super.key});
  //var _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          toolbarHeight: 83.00,
          backgroundColor: Colors.white,
          actions: <Widget>[
            Container(
              //color: Colors.white.withOpacity(_isHovered ? 0.5 : 1.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: InkWell(
                    //onHover: (isHovered) => {_isHovered = isHovered},
                    child: Text(
                      '¿Quiénes somos?',
                      style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontSize: 20,
                          fontFamily: 'alcaldia_fonts',
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      print('Quienes somos');
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: IconButton(
                onPressed: () {
                  print('Persona perfil');
                },
                iconSize: 30.0,
                color: AppTheme.primaryColor,
                icon: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 10,
              ),
              child: IconButton(
                onPressed: () {
                  print('Persona ayuda');
                },
                color: AppTheme.primaryColor,
                iconSize: 30.0,
                icon: Icon(Icons.help),
              ),
            ),
          ],
        ),
        body: ListView(children: const <Widget>[
          CarouselPage(),
        ]));
  }
}

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentIndex = 0;

  final List<String> _imageList = [
    'assets/images/main_scroll/main_1.jpeg',
    'assets/images/main_scroll/main_2.jpeg',
    'assets/images/main_scroll/main_3.jpeg',
  ];

  Offset _offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 7), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageList.length;
          startTimer();
        });
      }
    });
  }

  void goToPreviousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _imageList.length;
    });
  }

  void goToNextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO; Crear la formula para redimensionar los widgets
    double _imageWidth = MediaQuery.sizeOf(context).width; // Adjust as needed
    double _imageHeight = _imageWidth / 3; //

    return Stack(alignment: Alignment.center, children: <Widget>[
      Center(
        child: Container(
          color: Colors.green.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: <Widget>[],
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Container(
                  // Use a fixed-size container for consistent dimensions
                  width: _imageWidth,
                  height: _imageHeight,
                  child: Image.asset(
                    _imageList[_currentIndex],
                    key: ValueKey(_imageList[_currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      /* Row(
        children: [
          IconButton(
            iconSize: 75.0,
            color: AppTheme.primaryColor,
            icon: Icon(Icons.arrow_back),
            onPressed: goToPreviousImage,
          ),
          Spacer(), //TODO Este parametro debe ser dinamico, para que mantenga la proporcion de los elementos
          IconButton(
            iconSize: 75.0,
            color: AppTheme.primaryColor,
            icon: Icon(Icons.arrow_forward),
            onPressed: goToNextImage,
          ),
        ],
      ) */
    ]);
  }
}
