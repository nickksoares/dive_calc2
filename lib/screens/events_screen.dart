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
