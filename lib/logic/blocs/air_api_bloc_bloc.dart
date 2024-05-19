import 'package:air_quality/logic/api/api_list.dart';
import 'package:air_quality/logic/api/api_repositoryes.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'air_api_bloc_event.dart';
part 'air_api_bloc_state.dart';

class AirApiBlocBloc extends Bloc<AirApiBlocEvent, AirApiBlocState> {
  final ApiRepository apiRepositoory;
  AirApiBlocBloc({required this.apiRepositoory}) : super(AirApiBlocInitial()) {
    on<AqiLoadingEvent>(
      (event, emit) async {
        emit(AirAqiLoadingState());
        try {
          final AirQualityData api = await apiRepositoory.getAllAirQuality();
          emit(AirAqiLoadedState(api: api));
        } catch (e) {
          // ignore: avoid_print
          print('Ошибка при загрузке данных: $e');
          emit(AirAqiErrorState());
        }
      },
    );
  }
}
