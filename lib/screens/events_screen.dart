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
import 'package:dive_calc2/components/main_drawer.dart';
class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<String> events = [];

  void _addEvent() async {
    String? eventName = await _showAddEventDialog();
    if (eventName != null && eventName.isNotEmpty) {
      setState(() {
        events.add(eventName);
      });
    }
  }

  Future<String?> _showAddEventDialog() async {
    TextEditingController eventController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Ocorrência'),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(hintText: "Nome da Ocorrência"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Adicionar'),
              onPressed: () {
                Navigator.of(context).pop(eventController.text);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ocorrências'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addEvent,
          ),
        ],
      ),
      drawer: const MainDrawer(), // Adiciona o Drawer aqui
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(events[index]),
          );
        },
      ),
    );
  }
}
