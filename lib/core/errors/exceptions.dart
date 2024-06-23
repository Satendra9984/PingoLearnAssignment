class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({
    required this.message,
    required this.statusCode,
  });
}


class CacheException implements Exception {
  final String message;
  final int statusCode;

  CacheException({
    required this.message,
    required this.statusCode,
  });
}


class LocalAuthException implements Exception {
  final String message;
  final int statusCode;

  LocalAuthException({
    required this.message,
    required this.statusCode,
  });
}
