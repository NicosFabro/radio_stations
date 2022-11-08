part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.nowPlayingRadioStations = const [],
  });

  final HomeStatus status;
  final List<NowPlaying> nowPlayingRadioStations;

  @override
  List<Object?> get props => [status, nowPlayingRadioStations];

  HomeState copyWith({
    HomeStatus? status,
    List<NowPlaying>? nowPlayingRadioStations,
  }) {
    return HomeState(
      status: status ?? this.status,
      nowPlayingRadioStations:
          nowPlayingRadioStations ?? this.nowPlayingRadioStations,
    );
  }
}
