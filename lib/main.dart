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
          ),
          Text(
            'Conheça, Inspire, Preserve',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Expanded(child: NewsListPage()), // Lista de notícias
        ],
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  final List<String> news = [
    'Plantas urbanas ajudam a reduzir a poluição do ar',
    'Iniciativas de reciclagem crescem nas cidades brasileiras',
    'Comunidades adotam energia solar como alternativa sustentável',
    'Estudo mostra impacto do desmatamento na biodiversidade',
    'A importância da preservação de áreas verdes em centros urbanos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ecoradar')),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.eco, color: Colors.green),
            title: Text(news[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(newsTitle: news[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final String newsTitle;

  NewsDetailPage({required this.newsTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes da Notícia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Aqui você pode incluir o conteúdo completo da notícia. Por enquanto, estamos exibindo apenas o título.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
