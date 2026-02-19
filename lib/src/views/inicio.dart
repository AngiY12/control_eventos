import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Universidad de las Fuerzas Armadas - ESPE',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 25),
            const Text(
              'Nombre: Angeli Tello',
              style: TextStyle(fontSize: 22, fontFamily: 'Serif'),
            ),
            const Text(
              'Nivel: Sexto Semestre',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'Serif'),
            ),
          ],
        ),
      ),
    );
  }
}
