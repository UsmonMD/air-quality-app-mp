import 'package:air_quality/logic/api/api.dart';
import 'package:air_quality/logic/api/api_list.dart';

class ApiRepository {
  Future<AirQualityData> getAllAirQuality() => Api.getAllAirQuality();
}
