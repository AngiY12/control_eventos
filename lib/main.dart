import 'package:flutter/material.dart';
import 'package:controleseventos/src/views/inicio.dart';
import 'package:controleseventos/src/views/registro.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner "Debug"
      title: 'Control de Eventos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const myHomePage(title: 'Menú Principal'),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key, required this.title});
  final String title;

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int _formularioSeleccionado = 0;

  // 👇 Usa las clases tal como las tienes: inicio() y registro()
  static const List<Widget> _contenidos = [
    inicio(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _contenidos[_formularioSeleccionado],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Registro',
          ),
        ],
        currentIndex: _formularioSeleccionado,
        selectedItemColor: const Color.fromARGB(255, 214, 140, 198),
        onTap: (index) {
          setState(() {
            _formularioSeleccionado = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 254, 206, 248),
              ),
              child: Text(
                'Menú de opciones',
                style: TextStyle(color: Colors.blueAccent, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                setState(() {
                  _formularioSeleccionado = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Registro'),
              onTap: () {
                setState(() {
                  _formularioSeleccionado = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
