class BaseResponse {
  BaseResponse({required this.results});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      final results = List<Map<dynamic, dynamic>>.from(json['results'] as List);
      return BaseResponse(results: results);
    } else {
      return BaseResponse(results: []);
    }
  }

  final List<Map<dynamic, dynamic>> results;
}
