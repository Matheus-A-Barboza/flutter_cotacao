import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_atividade/model/favorite_currencies.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  Map<String, dynamic>? _quotes;

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://economia.awesomeapi.com.br/json/last'));

    if (response.statusCode == 200) {
      setState(() {
        _quotes = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _quotes == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _quotes!.length,
            itemBuilder: (context, index) {
              String currency = _quotes!.keys.elementAt(index);
              String value = _quotes![currency]['bid'];

              return ListTile(
                title: Text('$currency'),
                subtitle: Text('Valor: $value'),
                onLongPress: () {
                  Provider.of<FavoriteCurrencies>(context, listen: false).toggleFavorite(currency, value);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${currency.toUpperCase()} foi adicionado aos favoritos!')),
                  );
                },
              );
            },
          );
  }
}
