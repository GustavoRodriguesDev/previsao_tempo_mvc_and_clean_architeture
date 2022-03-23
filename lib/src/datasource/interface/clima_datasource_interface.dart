abstract class IClimateDataSource {
  Future<Map<String, dynamic>> getClimate(String city);
}
