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
          ImageCarousel(imageUrls: [
            'assets/images/main_scroll/main_1.jpeg',
            'assets/images/main_scroll/main_2.jpeg',
            'assets/images/main_scroll/main_3.jpeg',
          ])
        ]));
  }
}

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls; // List of image URLs
  const ImageCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          //
          return Image(
            width: 1512,
            height: double.infinity,
            image: AssetImage(widget.imageUrls[index]),
          );
        },
      ),
    );
  }
}
