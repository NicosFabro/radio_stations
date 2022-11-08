import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:radio/radio/radio.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc({
    required RadioService radioService,
    required NowPlaying nowPlaying,
    required int index,
  })  : _radioService = radioService,
        super(
          NowPlayingState(
            nowPlaying: nowPlaying,
            nowPlayingIndex: index,
          ),
        ) {
    on<GetNowPlayingRequested>(_onGetNowPlayingRequested);
    on<GetRadioStationInfoRequested>(_onGetRadioStationInfoRequested);
  }

  final RadioService _radioService;

  Future<void> _onGetNowPlayingRequested(
    GetNowPlayingRequested event,
    Emitter<NowPlayingState> emit,
  ) async {}

  Future<void> _onGetRadioStationInfoRequested(
    GetRadioStationInfoRequested event,
    Emitter<NowPlayingState> emit,
  ) async {}
}
