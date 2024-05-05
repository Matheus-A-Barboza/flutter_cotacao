import 'package:flutter/material.dart';
// import 'package:flutter_atividade/model/currency_quotes.dart';
import 'package:COTA.AI/model/favorite_currencies.dart';
import 'package:COTA.AI/views/home_screen.dart';
import 'package:COTA.AI/views/login_page.dart';
import 'package:COTA.AI/views/profile_page.dart';
import 'package:COTA.AI/views/quotes_page.dart';
import 'package:COTA.AI/views/register_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteCurrencies(),
      child: MaterialApp(
        title: 'Cotações de Moedas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomeScreen(),
          '/quotes': (context) => QuotesPage(), 
          '/profile':(context) => ProfilePage(), 
          '/register':(context) => RegisterPage(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => LoginPage());  // Página padrão para rotas desconhecidas
        },
      ),
    );
  }
}
