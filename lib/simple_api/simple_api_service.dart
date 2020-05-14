import 'dart:convert';

import 'package:coronadashboard/simple_api/models/Statistics.dart';
import 'package:http/http.dart' as http;

class SimpleAPIService {
  SimpleAPIService();

  Future<Statistics> getGlobalStatistics() async {
    var url = 'https://api.thevirustracker.com/free-api?global=stats';
    final Map<String, dynamic> map = await makeRequest(url);

    return Statistics.fromJson("Global", "ALL", map['results'][0]);
  }

  Future<List<Statistics>> getAllCountriesStatistics() async {
    var url = 'https://api.thevirustracker.com/free-api?countryTotals=ALL';
    Map<String, dynamic> map = await makeRequest(url);

    map = map["countryitems"][0];
    map.remove("stat");

    return map.values
        .map((e) => Statistics.fromJson(e["title"], e["code"], e))
        .toList();
  }

  Future<Statistics> getCountryStatistics(countryCode) async {
    var url =
        'https://api.thevirustracker.com/free-api?countryTotal=$countryCode';
    Map<String, dynamic> map = await makeRequest(url);

    map = map["countrydata"][0];

    Map<String, dynamic> info = map["info"];

    return Statistics.fromJson(info["title"], info["code"], map);
  }

  Future<Map<String, dynamic>> makeRequest(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return json.decode(response.body);
      }
    }
    print(
        'Request $url failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
