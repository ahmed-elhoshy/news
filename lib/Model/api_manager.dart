import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Model/NewsResponse.dart';
import 'package:newsapp/Model/SourceResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String sourceApi = '/v2/top-headlines/sources';
  static const String newsApi = '/v2/everything';

  static Future<SourceResponse?> getSource(String categoryId) async {
    Uri url = Uri.https(baseUrl, sourceApi,
        {'apiKey': 'c800ada37a164f80bd5b6f274548ab1e', 'category': categoryId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      print(response.body);
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String? sourceId) async {
    Uri url = Uri.https(baseUrl, newsApi,
        {'apiKey': 'c800ada37a164f80bd5b6f274548ab1e', 'sources': sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> searchNews(String query) async {
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=c36345bb98b44413aba608c9770954e0
    Uri url = Uri.https(baseUrl, newsApi,
        {'apiKey': 'c36345bb98b44413aba608c9770954e0', 'q': query});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw (e);
    }
  }
}
