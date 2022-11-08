part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.radioStations = const [],
  });

  final HomeStatus status;
  final List<Radio> radioStations;

  @override
  List<Object?> get props => [status, radioStations];

  HomeState copyWith({
    HomeStatus? status,
    List<Radio>? radioStations,
  }) {
    return HomeState(
      status: status ?? this.status,
      radioStations: radioStations ?? this.radioStations,
    );
  }
}
