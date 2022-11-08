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
    on<HomeRadioStationsRequested>(_onHomeRadioStationsRequested);
  }

  final RadioService _radioService;

  Future<void> _onHomeRadioStationsRequested(
    HomeRadioStationsRequested event,
    Emitter<HomeState> emit,
  ) async {
    log('_onHomeRadioStationsRequested');
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final radioStations = await _radioService.getRadioStations();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          radioStations: radioStations,
        ),
      );
    } on GetRadioStationsException {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
