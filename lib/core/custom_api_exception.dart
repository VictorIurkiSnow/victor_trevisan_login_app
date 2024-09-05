class CustomApiException implements Exception {
  final String message;

  CustomApiException(this.message);

  @override
  String toString() => message;
}