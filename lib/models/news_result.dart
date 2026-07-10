import 'news_error.dart';

class NewsResult<T> {
  final T? data;
  final NewsError? error;
  final Status status;

  NewsResult.notInitialized()
      : data = null,
        error = null,
        status = Status.notInitialized;

  NewsResult.loading({
    this.data,
  })  : error = null,
        status = Status.loading;

  NewsResult.success(
    this.data,
  )   : error = null,
        status = Status.success;

  NewsResult.failure(
    this.error,
  )   : data = null,
        status = Status.failure;

  bool get isSuccess => status == Status.success;

  bool get isLoading => status == Status.loading;

  bool get isError => status == Status.failure;

  bool get isNotInitialized => status == Status.notInitialized;

  @override
  String toString() {
    switch (status) {
      case Status.notInitialized:
        return 'NewsResult.notInitialized';
      case Status.loading:
        return 'NewsResult.loading(data: $data)';
      case Status.success:
        return 'NewsResult.success(data: $data)';
      case Status.failure:
        return 'NewsResult.failure(error: $error)';
    }
  }
}

enum Status {
  notInitialized,
  loading,
  success,
  failure,
}
