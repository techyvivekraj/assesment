class ModelSerializationException implements Exception {
  final String message;

  ModelSerializationException(this.message);

  @override
  String toString() {
    return "ModelSerializationException: $message";
  }
}
