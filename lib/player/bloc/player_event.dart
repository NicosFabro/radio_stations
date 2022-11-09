part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class StreamRadioStationRequested extends PlayerEvent {
  const StreamRadioStationRequested({required this.streamURL});

  final String streamURL;
}
