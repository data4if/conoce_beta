import 'package:conoce_beta/configuration/router/app_router.dart';
import 'package:flutter/material.dart';

class NarrowHome extends StatelessWidget {
  const NarrowHome({super.key});

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
      body: Container(
        color: Colors.pink,
      ),
    );
  }
}
