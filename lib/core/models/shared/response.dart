class ResponseModel<T> {
  final T? data;
  final dynamic? error;
  final bool success;
  final int statusCode;
  final String? message;

  ResponseModel({
    this.data,
    this.error,
    required this.success,
    required this.statusCode,
    this.message,
  });
}
