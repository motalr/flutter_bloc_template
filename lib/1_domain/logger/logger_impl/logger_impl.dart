import '../logger.dart';

class LoggerImpl implements Logger {
  LoggerImpl();

  @override
  void log(String source, Exception exception) {
    try {
      print('Logger: $source -> {exception.message.toString()}');
    } on Exception catch (_) {}
  }
}
