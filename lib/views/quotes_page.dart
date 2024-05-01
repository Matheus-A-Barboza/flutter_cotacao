import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_atividade/model/favorite_currencies.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage>{
  Map<String, dynamic>? _quotes;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async{
    final response = await http.get(Uri.parse('https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL,BTC-BRL'));

    if (response.statusCode == 200){
      setState(() {
        _quotes = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return _isLoading
    ? Center(child: CircularProgressIndicator()):
    (_quotes == null || _quotes!.isEmpty)
    ? Center(child: Text('Nenhuma Cotação disponivel.'))
    : ListView.builder(
      itemCount: _quotes!.length,
      itemBuilder: (cotext, index){
        String currency = _quotes!.keys.elementAt(index);
        String value = _quotes![currency]['bid'];

        return ListTile(
          title: Text('$currency'),
          subtitle: Text('Valor: $value'),
          onLongPress: (){
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