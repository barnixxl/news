import '../main.dart';

class NewsError {
  final int errorCode;
  final String errorMessage;

  const NewsError({required this.errorCode, required this.errorMessage});

  static const int unknownCode = -1;
  static const int timeoutCode = 1;
  static const int noInternetCode = 2;
  static const int serverCode = 3;
  static const int badResponseCode = 4;
  static const int cancelledCode = 5;
  static const int parsingCode = 6;
  static const int noDataCode = 7;
  static const int loadFailedCode = 8;
  static const int badCertificateCode = 9;

  @override
  String toString() => errorMessage;

  factory NewsError.fromException(Object e) {
    if (e is NewsError) {
      return e;
    }
    return NewsError(errorCode: unknownCode, errorMessage: e.toString());
  }

  factory NewsError.timeout() => NewsError(errorCode: timeoutCode, errorMessage: strings.error_timeout);

  factory NewsError.noInternet() => NewsError(errorCode: noInternetCode, errorMessage: strings.error_no_internet);

  factory NewsError.serverError(int statusCode) =>
      NewsError(errorCode: serverCode, errorMessage: strings.error_server(statusCode));

  factory NewsError.badResponse(int statusCode) =>
      NewsError(errorCode: badResponseCode, errorMessage: strings.error_bad_response(statusCode));

  factory NewsError.badCertificate() =>
      NewsError(errorCode: badCertificateCode, errorMessage: strings.error_bad_certificate);

  factory NewsError.cancelled() => NewsError(errorCode: cancelledCode, errorMessage: strings.error_cancelled);

  factory NewsError.unknown() => NewsError(errorCode: unknownCode, errorMessage: strings.error_unknown);

  factory NewsError.parsing() => NewsError(errorCode: parsingCode, errorMessage: strings.error_parsing);

  factory NewsError.noData() => NewsError(errorCode: noDataCode, errorMessage: strings.error_no_data);

  factory NewsError.loadFailed() => NewsError(errorCode: loadFailedCode, errorMessage: strings.error_load_failed);
}
