import 'package:flutter/material.dart';
import 'package:dive_calc2/screens/events_screen.dart';
import 'package:dive_calc2/screens/main_screen.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Tela Principal'),
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Ocorrências'),
            onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EventsScreen()),
                  );
            },
          ),
        ],
      ),
    );
  }
}