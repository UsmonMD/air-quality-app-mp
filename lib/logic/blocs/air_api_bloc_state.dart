part of 'air_api_bloc_bloc.dart';

@immutable
sealed class AirApiBlocState {}

final class AirApiBlocInitial extends AirApiBlocState {}

class AirAqiLoadingState extends AirApiBlocState {}

class AirAqiLoadedState extends AirApiBlocState {
  final AirQualityData api;
  AirAqiLoadedState({required this.api});
}

class AirAqiErrorState extends AirApiBlocState {}
