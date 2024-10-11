import 'package:dive_calc2/screens/lifter_refloat_screen.dart';
import 'package:flutter/material.dart';
import 'package:dive_calc2/screens/liftbag_refloat_screen.dart';

class RefloatScreen extends StatelessWidget {
  const RefloatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflutuação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LifterRefloatScreen()));
              },
              child: const Text('Sem liftbag'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LiftbagRefloatScreen()));
              },
              child: const Text('Com liftbag'),
            ),
          ],
        ),
      ),
    );
  }
}