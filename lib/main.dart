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

class News {
  final String title;
  final String content;

  News({required this.title, required this.content});
}

class NewsListPage extends StatelessWidget {
  final List<News> news = [
    News(
      title: 'Plantas urbanas ajudam a reduzir a poluição do ar',
      content: 'Estudos mostram que o plantio de árvores em áreas urbanas ajuda a reduzir poluentes e melhora a qualidade do ar, beneficiando a saúde da população.'
    ),
    News(
      title: 'Iniciativas de reciclagem crescem nas cidades brasileiras',
      content: 'Diversas cidades brasileiras têm implementado programas de reciclagem que incentivam a população a separar resíduos, reduzindo a quantidade de lixo em aterros sanitários.'
    ),
    News(
      title: 'Comunidades adotam energia solar como alternativa sustentável',
      content: 'Residências e comunidades estão investindo em painéis solares, reduzindo o consumo de energia elétrica e promovendo sustentabilidade ambiental.'
    ),
    News(
      title: 'Estudo mostra impacto do desmatamento na biodiversidade',
      content: 'Pesquisadores alertam que o desmatamento acelerado compromete espécies animais e vegetais, afetando o equilíbrio ecológico.'
    ),
    News(
      title: 'A importância da preservação de áreas verdes em centros urbanos',
      content: 'Parques e áreas verdes em cidades são essenciais para o bem-estar dos moradores, ajudando na redução do calor urbano e na promoção da biodiversidade local.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EcoRadar')),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.eco, color: Colors.green),
            title: Text(news[index].title),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news[index]),
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
  final News news;

  NewsDetailPage({required this.news});

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
              news.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(news.content, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
