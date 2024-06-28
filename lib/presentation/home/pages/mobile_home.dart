import 'package:conoce_beta/configuration/router/app_router.dart';
import 'package:flutter/material.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/logos/fomutur.png'),
            ),
            ListTile(
              title: Text('Iniciar Sesion'),
              subtitle: Text('Conece - Alfa'),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => Container(),
              ),
            ),
            ListTile(
              title: Text('OPT - 1'),
              subtitle: Text('Feature waiting'),
              onTap: () => appRouter.go('/'),
            ),
            ListTile(
              title: Text('OPT - 2'),
              subtitle: Text('Feature waiting'),
              onTap: () => {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const CarouselPage(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: double.infinity,
                  height: 100.0,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text('Parrafo 1'),
                      ),
                      Expanded(
                        child: Text('Parrafo 2'),
                      ),
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
