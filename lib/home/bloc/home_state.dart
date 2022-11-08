part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.radioStations = const [],
  });

  final HomeStatus status;
  final List<RadioStation> radioStations;

  @override
  List<Object?> get props => [status, radioStations];

  HomeState copyWith({
    HomeStatus? status,
    List<RadioStation>? radioStations,
  }) {
    return HomeState(
      status: status ?? this.status,
      radioStations: radioStations ?? this.radioStations,
    );
  }
}
