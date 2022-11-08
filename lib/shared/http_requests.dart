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
        'X-RapidAPI-Key': EnvConstants.x_rapidapi_key,
        'X-RapidAPI-Host': EnvConstants.x_rapidapi_host,
      },
    );

    return response;
  }
}
