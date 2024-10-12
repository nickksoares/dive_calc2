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
import 'package:dive_calc2/utils/refloat_logic.dart';

class LifterRefloatScreen extends StatefulWidget {
  const LifterRefloatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LifterRefloatScreenState createState() => _LifterRefloatScreenState();
}

class _LifterRefloatScreenState extends State<LifterRefloatScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();
  final _profundidadeController = TextEditingController();
  final _pesoLifterController = TextEditingController();
  final _volumeController = TextEditingController();
  final _litrosController = TextEditingController();
  Map refloatThreeQuartersScreen = {};
  Map refloatOnetoOneScreen = {};

  void _calculateRefloat() {
    if (_formKey.currentState!.validate()) {
      final peso = double.parse(_pesoController.text);
      final profundidade = double.parse(_profundidadeController.text);
      final pesoLifter = double.parse(_pesoLifterController.text);
      final volume = double.parse(_volumeController.text);
      final litros = double.parse(_litrosController.text);

      setState(() {
         refloatThreeQuartersScreen = refloatThreeQuarters(
          weight: peso, 
          depth: profundidade,
          lifterWeight: pesoLifter,
          lifterVolume: volume, 
          cylinderVolume: litros);
         refloatOnetoOneScreen = refloatOnetoOne(
          weight: peso, 
          depth: profundidade, 
          lifterWeight: pesoLifter,
          lifterVolume: volume, 
          cylinderVolume: litros);
      });
    }
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _profundidadeController.dispose();
    _volumeController.dispose();
    _litrosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflutuação com reflutuador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _pesoController,
                decoration: const InputDecoration(labelText: 'Peso do objeto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso do objeto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _profundidadeController,
                decoration: const InputDecoration(labelText: 'Profundidade real do objeto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a profundidade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pesoLifterController,
                decoration: const InputDecoration(labelText: 'Peso do reflutuador'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o peso do reflutuador';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _volumeController,
                decoration: const InputDecoration(labelText: 'Volume do reflutuador em litros'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o volume';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _litrosController,
                decoration: const InputDecoration(labelText: 'Volume do cilindro em litros'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira os litros';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateRefloat,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              if (refloatOnetoOneScreen.isNotEmpty && refloatThreeQuartersScreen.isNotEmpty) ...[
                Text('Para reflutuar usando 3/4 do peso do objeto seriam necessarios: \n${refloatThreeQuartersScreen['volumeNeeded']} litros\n${refloatThreeQuartersScreen['volumeNeededCylinders']} cilindros\n${refloatThreeQuartersScreen['refloatsNeeded']} reflutuadores'),
                //Text('$refloatThreeQuartersScreen'),
                Text('Para reflutuar usando o peso real do objeto seriam necessarios: \n${refloatOnetoOneScreen['volumeNeeded']} litros\n${refloatOnetoOneScreen['volumeNeededCylinders']} cilindros\n${refloatOnetoOneScreen['refloatsNeeded']} reflutuadores'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}