import 'package:flutter/material.dart';

void main() {
  runApp(EcoRadarApp());
}

class EcoRadarApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoRadar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    ); 
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoRadar'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          // Exibição da logo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('../assets/images/ecoradar.png',
            height: 250),
          )
        ],
      ),
    );
  }
}
