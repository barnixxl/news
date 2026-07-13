import 'news_error.dart';

class NewsResult<T> {
  final T? data;
  final NewsError? error;
  final Status status;

  NewsResult.loading({this.data}) : error = null, status = Status.loading;

  NewsResult.success(this.data) : error = null, status = Status.success;

  NewsResult.failure(this.error) : data = null, status = Status.failure;

  bool get isSuccess => status == Status.success;

  bool get isLoading => status == Status.loading;

  bool get isError => status == Status.failure;

  @override
  String toString() {
    switch (status) {
      case Status.loading:
        return 'NewsResult.loading(data: $data)';
      case Status.success:
        return 'NewsResult.success(data: $data)';
      case Status.failure:
        return 'NewsResult.failure(error: $error)';
    }
  }
}

enum Status { loading, success, failure }
