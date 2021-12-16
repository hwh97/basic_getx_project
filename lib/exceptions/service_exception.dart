class ServiceException implements Exception {
  final String service;
  final String message;

  ServiceException(this.service, this.message);

  @override
  String toString() {
    return "ServiceException name: $service message:$message";
  }
}
