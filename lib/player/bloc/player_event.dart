part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class StreamRadioStationRequested extends PlayerEvent {
  const StreamRadioStationRequested({required this.nowPlaying});

  final NowPlaying nowPlaying;
}

class TogglePlayerRequested extends PlayerEvent {
  const TogglePlayerRequested();
}
