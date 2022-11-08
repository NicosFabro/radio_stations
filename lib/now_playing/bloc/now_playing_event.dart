part of 'now_playing_bloc.dart';

abstract class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingRequested extends NowPlayingEvent {
  const GetNowPlayingRequested();
}

class GetRadioStationInfoRequested extends NowPlayingEvent {
  const GetRadioStationInfoRequested({required this.radioId});

  final String radioId;
}
