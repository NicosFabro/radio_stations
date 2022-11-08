class RadioResults {
  RadioResults({required this.results});

  factory RadioResults.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      final results = List<Map<dynamic, dynamic>>.from(json['results'] as List)
          .map((v) => RadioStation.fromJson(Map<String, dynamic>.from(v)))
          .toList();

      return RadioResults(results: results);
    } else {
      return RadioResults(results: []);
    }
  }

  final List<RadioStation> results;
}

class RadioStation {
  RadioStation({
    required this.id,
    required this.name,
    required this.country,
    required this.genreId,
    required this.genreName,
    required this.streamUrl,
    required this.logo,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) => RadioStation(
        id: json['i'] as String,
        name: json['n'] as String,
        country: json['c'] as String,
        genreId: json['d'] as String,
        genreName: json['g'] as String,
        streamUrl: json['u'] as String,
        logo: json['l'] as String,
      );

  final String id;
  final String name;
  final String country;
  final String genreId;
  final String genreName;
  final String streamUrl;
  final String logo;
}
