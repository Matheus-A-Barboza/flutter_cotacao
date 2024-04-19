import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getCoin() async {
  var url = Uri.parse('https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL');
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['xml'];
  } else {
    throw Exception('Falha ao carregar os produtos');
  }
}
