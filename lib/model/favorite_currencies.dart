import 'package:flutter/foundation.dart';
import 'package:flutter_atividade/model/currency_quotes.dart';

class FavoriteCurrencies with ChangeNotifier {
  List<CurrencyQuote> _favorites = [];

  List<CurrencyQuote> get favorites => _favorites;

  void toggleFavorite(String currency, String value) {
    if (_favorites.any((quote) => quote.currency == currency)) {
      _favorites.removeWhere((quote) => quote.currency == currency);
    } else {
      _favorites.add(CurrencyQuote(currency: currency, value: value));
    }
    notifyListeners();
  }
}