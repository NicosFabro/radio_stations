import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/radio.dart';
import 'package:radio/shared/shared.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required RadioService radioService})
      : _radioService = radioService,
        super(const HomeState()) {
    on<GetNowPlayingRadioStationsRequested>(
      _onGetNowPlayingRadioStationsRequested,
    );
  }

  final RadioService _radioService;

  Future<void> _onGetNowPlayingRadioStationsRequested(
    GetNowPlayingRadioStationsRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      // This returns a list of Radio Stations playing right now
      // and their NowPlaying songs with the dates.
      final nowPlayingRadioStations =
          await _radioService.getNowPlayingRadioStations();

      /* Uncomment these lines and add replace the parameter on line 45
         for [uniqueList] if you want a list with unique Radio Stations.
      */

      // final seen = <String>{};
      // final uniqueList = nowPlayingRadioStations
      //     .where((element) => seen.add(element.radioId))
      //     .toList();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          nowPlayingRadioStations: nowPlayingRadioStations,
        ),
      );
    } on GetRadioStationsException {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
