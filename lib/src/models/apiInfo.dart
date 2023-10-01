class ApiInfo {
  String apiVersion;
  String applicationVersion;
  String baseUrl;

  ApiInfo({
    required this.apiVersion,
    required this.baseUrl,
    required this.applicationVersion,
  });

  factory ApiInfo.fromJson(Map<String, dynamic> json) {
    return ApiInfo(
      apiVersion: json['ApiVersion'],
      applicationVersion: json['ApplicationVersion'],
      baseUrl: json['BaseUrl'],
    );
  }

  @override
  String toString() {
    return 'ApiInfo{apiVersion: $apiVersion, applicationVersion: $applicationVersion, baseUrl: $baseUrl}';
  }
}
