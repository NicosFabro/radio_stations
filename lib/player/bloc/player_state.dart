part of 'player_bloc.dart';

enum PlayerStatus { initial, loading, playing, stopped, failed }

class PlayerState extends Equatable {
  const PlayerState({
    this.status = PlayerStatus.initial,
    this.streamingURL = '',
  });

  final PlayerStatus status;
  final String streamingURL;

  @override
  List<Object?> get props => [status, streamingURL];

  PlayerState copyWith({
    PlayerStatus? status,
    String? streamingURL,
  }) {
    return PlayerState(
      status: status ?? this.status,
      streamingURL: streamingURL ?? this.streamingURL,
    );
  }
}
