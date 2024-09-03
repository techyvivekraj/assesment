class DateCastingException implements Exception {
  final String message;

  DateCastingException(this.message);

  @override
  String toString() {
    return "DateCastingException: $message";
  }
}
