
class RestClientResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
}
