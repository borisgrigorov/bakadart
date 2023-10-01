class BakaException implements Exception {
  final String message;
  final String? cause;
  final String code;

  BakaException(this.message, this.code, [this.cause]);

  @override
  String toString() {
    return 'BakaException: $message';
  }
}
