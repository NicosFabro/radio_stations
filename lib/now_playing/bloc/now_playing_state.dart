part of 'now_playing_bloc.dart';

enum NowPlayingStatus { initial, loading, success, failure }

class NowPlayingState extends Equatable {
  const NowPlayingState({
    this.status = NowPlayingStatus.initial,
    this.radioStation = RadioStation.empty,
    this.nowPlaying = NowPlaying.empty,
    this.nowPlayingIndex = 0,
  });

  final NowPlayingStatus status;
  final RadioStation radioStation;
  final NowPlaying nowPlaying;
  final int nowPlayingIndex;

  @override
  List<Object?> get props => [
        status,
        radioStation,
        nowPlaying,
      ];

  NowPlayingState copyWith({
    NowPlayingStatus? status,
    RadioStation? radioStation,
    NowPlaying? nowPlaying,
    int? nowPlayingIndex,
  }) {
    return NowPlayingState(
      status: status ?? this.status,
      radioStation: radioStation ?? this.radioStation,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      nowPlayingIndex: nowPlayingIndex ?? this.nowPlayingIndex,
    );
  }
}
