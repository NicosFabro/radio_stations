class RadioResults {
  RadioResults({required this.results});

  factory RadioResults.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      final results = <Radio>[];
      json['results'].forEach((v) {
        results.add(Radio.fromJson(v as Map<String, dynamic>));
      });
      return RadioResults(results: results);
    } else {
      return RadioResults(results: []);
    }
  }

  final List<Radio> results;
}

class Radio {
  Radio({
    required this.id,
    required this.name,
    required this.country,
    required this.genreId,
    required this.genreName,
    required this.streamUrl,
    required this.logo,
  });

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
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
