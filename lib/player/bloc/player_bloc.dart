import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/radio.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(const PlayerState()) {
    on<StreamRadioStationRequested>(_onStreamRadioStationRequested);
    on<TogglePlayerRequested>(_onTogglePlayerRequested);
  }

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  Future<void> _onStreamRadioStationRequested(
    StreamRadioStationRequested event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(status: PlayerStatus.loading));

    try {
      if (state.status == PlayerStatus.playing) {
        await _assetsAudioPlayer.stop();
      }
      await _assetsAudioPlayer.open(
        Audio.liveStream(event.nowPlaying.radioStream),
      );

      emit(
        state.copyWith(
          status: PlayerStatus.playing,
          nowPlaying: event.nowPlaying,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PlayerStatus.failed));
    }
  }

  Future<void> _onTogglePlayerRequested(
    TogglePlayerRequested event,
    Emitter<PlayerState> emit,
  ) async {
    switch (state.status) {
      case PlayerStatus.initial:
      case PlayerStatus.loading:
      case PlayerStatus.failed:
        break;
      case PlayerStatus.playing:
        await _assetsAudioPlayer.stop();
        emit(state.copyWith(status: PlayerStatus.stopped));
        break;
      case PlayerStatus.stopped:
        await _assetsAudioPlayer.play();
        emit(state.copyWith(status: PlayerStatus.playing));
        break;
    }
  }

  @override
  Future<void> close() async {
    await _assetsAudioPlayer.dispose();
    await super.close();
  }
}
