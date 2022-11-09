import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(const PlayerState()) {
    on<StreamRadioStationRequested>(_onStreamRadioStationRequested);
  }

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  Future<void> _onStreamRadioStationRequested(
    StreamRadioStationRequested event,
    Emitter<PlayerState> emit,
  ) async {
    log('_onStreamRadioStationRequested: loading');
    emit(state.copyWith(status: PlayerStatus.loading));

    try {
      if (state.streamingURL != event.streamURL) {
        await _assetsAudioPlayer.stop();
        log('_onStreamRadioStationRequested: opening url');
        await _assetsAudioPlayer.open(Audio.liveStream(event.streamURL));
        log('streaming: ${event.streamURL}');
        emit(state.copyWith(status: PlayerStatus.playing));
      }
    } catch (e) {
      log('_onStreamRadioStationRequested: failed');
      emit(state.copyWith(status: PlayerStatus.failed));
    }
    log('_onStreamRadioStationRequested: finished');
  }
}
