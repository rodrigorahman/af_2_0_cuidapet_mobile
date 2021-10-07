class UserExistsException implements Exception {
  final String? message;

  UserExistsException([
    this.message,
  ]);
}
