import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WideHome extends StatelessWidget {
  const WideHome({super.key});

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
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: InkWell(
                child: Text(
                  'Quienes somos?',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontFamily: 'alcaldia_fonts',
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  print('Quienes somos');
                },
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
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
