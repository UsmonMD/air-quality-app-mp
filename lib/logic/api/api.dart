import 'package:air_quality/logic/api/api_list.dart';
import 'package:dio/dio.dart';

abstract class Api {
  static final Dio dio = Dio();
  static Future<AirQualityData> getAllAirQuality() async {
    final airQualityResponse = await dio.get(
      'https://api.airvisual.com/v2/nearest_city?key=8e37d169-d7c1-4721-b477-7b80f8f08be1',
    );
    try {
      final airQuality = AirQualityData.fromJson(airQualityResponse.data);
      return airQuality;
    } catch (e) {
      final airQuality = AirQualityData.fromJson(airQualityResponse.data);
      return airQuality;
    }
  }
}
