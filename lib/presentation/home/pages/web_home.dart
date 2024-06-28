import 'dart:async';
import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 170.0,
        leading: Container(
          padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
          alignment: Alignment.centerLeft,
          child: const Image(
            width: 100.0, // Set a fixed width for better layout
            height: 80.0, // Set a fixed height for better layout
            image: AssetImage('assets/images/logos/fomutur.png'),
          ),
        ),
        toolbarHeight: 83.00,
        backgroundColor: Colors.white,
        actions: <Widget>[
          /*   SvgPicture.asset(
            "assets/images/svg/who_we_are_1.svg",
            width: 60.0,
            height: 60.0,
          ), */
          InkWell(
            child: Text(
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
          Padding(
            padding: const EdgeInsets.all(5.0),
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
            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
            child: IconButton(
              onPressed: () {
                print('Persona ayuda');
              },
              iconSize: 30.0,
              color: AppTheme.primaryColor,
              icon: Icon(Icons.help),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselPage(),
          Row(
            children: [
              Container(
                  height: 100.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Parrafo 1'),
                      Text('Parrafo 2'),
                    ],
                  ))
            ],
          )
          // Add other list items here (if needed)
        ],
      ),
    );
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
    'assets/images/main/main_1.jpeg',
    'assets/images/main/main_2.jpeg',
    'assets/images/main/main_3.jpeg',
  ];

  void startTimer() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _imageList.length;
          print(_currentIndex);
        });
      }
      // Call startTimer again to repeat the process
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
    double _imageWidth = MediaQuery.of(context).size.width;
    double _imageHeight = _imageWidth / 3; // Maintain aspect ratio

    return Stack(
      alignment: Alignment.center,
      children: [
        // Container with background color (optional)
        Container(
          color: Colors.green.withOpacity(0.5), // Adjust color and opacity
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /* IconButton(
                onPressed: goToPreviousImage,
                icon: Icon(Icons.arrow_back,
                    color: Colors.white), // Adjust icon color
              ), */
              Container(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: _imageWidth,
                    height: _imageHeight,
                    child: Image.asset(
                      _imageList[_currentIndex],
                      key: ValueKey(_imageList[_currentIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              ),
              /* IconButton(
                onPressed: goToNextImage,
                icon: Icon(Icons.arrow_forward,
                    color: Colors.white), // Adjust icon color
              ), */
            ],
          ),
        ),
      ],
    );
  }
}
