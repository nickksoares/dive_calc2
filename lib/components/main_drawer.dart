/*
<DiveCalc is an app to help Public Safety Divers>
Copyright (C) <2024>  <Nicollas Soares Goncalves>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

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