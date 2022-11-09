part of 'player_bloc.dart';

enum PlayerStatus { initial, loading, playing, stopped, failed }

class PlayerState extends Equatable {
  const PlayerState({
    this.status = PlayerStatus.initial,
    this.nowPlaying = NowPlaying.empty,
  });

  final PlayerStatus status;
  final NowPlaying nowPlaying;

  @override
  List<Object?> get props => [status, nowPlaying];

  PlayerState copyWith({
    PlayerStatus? status,
    NowPlaying? nowPlaying,
  }) {
    return PlayerState(
      status: status ?? this.status,
      nowPlaying: nowPlaying ?? this.nowPlaying,
    );
  }
}
