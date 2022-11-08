import 'package:equatable/equatable.dart';

class RadioStation extends Equatable {
  const RadioStation({
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

  static const empty = RadioStation(
    id: '',
    name: '',
    country: '',
    genreId: '',
    genreName: '',
    streamUrl: '',
    logo: '',
  );

  @override
  List<Object> get props => [
        id,
        name,
        country,
      ];
}
