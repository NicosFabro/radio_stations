import 'package:http/http.dart' as http;
import 'package:radio/shared/shared.dart';

class HttpRequests {
  static Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': EnvConstants.xRapidKey,
        'X-RapidAPI-Host': EnvConstants.xRapidHost,
      },
    );

    return response;
  }
}
