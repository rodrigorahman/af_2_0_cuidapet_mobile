import 'package:logger/logger.dart' as log;


abstract class Logger {
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]);
  void append(dynamic message);
  void closeAppend();
}


class LoggerImpl implements Logger {

  List<String> messages = [];

  final logger = log.Logger();

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    logger.d(message, error, stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    logger.e(message, error, stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    logger.i(message, error, stackTrace);
  }

  @override
  void warning(message, [error, StackTrace? stackTrace]) {
    logger.w(message, error, stackTrace);
  }

  @override
  void append(message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages = [];
  }
}