import 'package:equatable/equatable.dart';

class NowPlaying extends Equatable {
  const NowPlaying({
    required this.radioId,
    required this.radioName,
    required this.radioLogo,
    required this.radioStream,
    required this.titleSong,
    required this.artistSong,
  });

  factory NowPlaying.fromJson(Map<String, dynamic> json) {
    return NowPlaying(
      radioId: json['radio_id'] as String,
      radioName: json['radio_name'] as String,
      radioLogo: json['radio_logo'] as String,
      radioStream: json['radio_stream'] as String,
      titleSong: json['title_song'] as String,
      artistSong: json['artist_song'] as String,
    );
  }

  final String radioId;
  final String radioName;
  final String radioLogo;
  final String radioStream;
  final String titleSong;
  final String artistSong;

  static const empty = NowPlaying(
    radioId: '',
    radioName: '',
    radioLogo: '',
    radioStream: '',
    titleSong: '',
    artistSong: '',
  );

  @override
  List<Object> get props => [
        radioId,
        radioName,
        titleSong,
        artistSong,
      ];
}
