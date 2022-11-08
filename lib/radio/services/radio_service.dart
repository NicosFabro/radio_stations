import 'dart:convert';

import 'package:radio/radio/radio.dart';
import 'package:radio/radio/services/response_examples.dart';
import 'package:radio/shared/shared.dart';

class RadioService {
  static const _host = '30-000-radio-stations-and-music-charts.p.rapidapi.com';

  Future<List<RadioStation>> getRadioStations() async {
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
      final baseResponse = BaseResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      return baseResponse.results
          .map((r) => RadioStation.fromJson(Map<String, dynamic>.from(r)))
          .toList();
    } else {
      throw GetRadioStationsException();
    }
  }

  Future<List<NowPlaying>> getNowPlayingRadioStations() async {
    const path = 'rapidapi';

    final url = Uri.https(
      _host,
      path,
      {'nowplaying': '1'},
    );

    final response = await HttpRequests.get(url);

    if (response.statusCode == 200) {
      final baseResponse = BaseResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      return baseResponse.results
          .map((r) => NowPlaying.fromJson(Map<String, dynamic>.from(r)))
          .toList();
    } else {
      throw GetNowPlayingRadioStationsException();
    }
  }

  Future<RadioStation> getRadioStationInfo(String id) async {
    const path = 'rapidapi';

    final url = Uri.https(
      _host,
      path,
      {'id': id},
    );

    final response = await HttpRequests.get(url);

    if (response.statusCode == 200) {
      final baseResponse = BaseResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      if (baseResponse.results.isEmpty) {
        throw GetRadioStationsInfoEmptyException();
      } else {
        return RadioStation.fromJson(
          Map<String, dynamic>.from(baseResponse.results.first),
        );
      }
    } else {
      throw GetRadioStationsInfoException();
    }
  }

  static String getLogoURL(String logo) =>
      'https://www.radioair.info/images_radios/$logo';
}
