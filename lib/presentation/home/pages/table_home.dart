import 'dart:async';
import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainPage(),
            PresentationSection(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(83.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        NavItem(
          title: '¿Quiénes somos?',
          onTap: () => print('Quienes somos'),
        ),
        NavIconButton(
          icon: Icons.person,
          onPressed: () => print('Persona perfil'),
        ),
        NavIconButton(
          icon: Icons.help,
          onPressed: () => print('Persona ayuda'),
        ),
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 20.0,
              fontFamily: 'alcaldia_fonts',
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class NavIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const NavIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 30.0,
        color: AppTheme.primaryColor,
        icon: Icon(icon),
      ),
    );
  }
}

class PresentationSection extends StatelessWidget {
  const PresentationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
          child: Image.asset(
            _imageList[_currentIndex],
            fit: BoxFit.cover,
            key: ValueKey(_imageList[_currentIndex]),
          ),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        const ContentOverlay(),
      ],
    );
  }
}

class ContentOverlay extends StatelessWidget {
  const ContentOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    var realtiimeHeight = MediaQuery.of(context).size.height;
    var realtimeWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          //bottom: 0.4,
          child: AspectRatio(
            aspectRatio: 5.7 / 2.2, // Ajusta según la proporción que desees
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "images/brand/conoce.png", // Corregida la ruta de la imagen
                /* width: 300,
                height: 300, */
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: realtiimeHeight * 0.1,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Tenemos lago, china, puente y ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'alcaldia_fonts',
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'mucho mas!',
                  style: TextStyle(
                    color: AppTheme.accentColor,
                    fontFamily: 'alcaldia_fonts',
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
