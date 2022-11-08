import 'dart:convert';

import 'package:radio/radio/radio.dart';
import 'package:radio/shared/shared.dart';

class RadioService {
  static const _host = '30-000-radio-stations-and-music-charts.p.rapidapi.com';

  Future<RadioResults> getRadioStations() async {
    const path = 'rapidapi';

    final url = Uri.https(
      _host,
      path,
      {
        'genre': 'ALL',
        'search_keyword': 'FM',
        'country': 'ALL',
      },
    );

    final response = await HttpRequests.get(url);

    if (response.statusCode == 200) {
      return RadioResults.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw GetRadioStationsException();
    }
  }
}
