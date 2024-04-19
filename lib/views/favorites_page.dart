import 'package:flutter/material.dart';
import 'package:flutter_atividade/model/currency_quotes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_atividade/model/favorite_currencies.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CurrencyQuote> favorites = Provider.of<FavoriteCurrencies>(context).favorites;

    return favorites.isEmpty
        ? Center(child: Text('Nenhum favorito adicionado.'))
        : ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(favorites[index].currency),
                subtitle: Text('Valor: ${favorites[index].value}'),
                onTap: () {
                  Provider.of<FavoriteCurrencies>(context, listen: false).toggleFavorite(favorites[index].currency, favorites[index].value);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${favorites[index].currency.toUpperCase()} foi removido dos favoritos!')),
                  );
                },
              );
            },
          );
  }
}
