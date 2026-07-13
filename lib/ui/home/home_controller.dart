import 'package:mobx/mobx.dart';

import '../../models/news_error.dart';
import '../../models/news_item.dart';
import '../../models/news_result.dart';
import '../../repository/news_repository.dart';

class HomeController {
  final NewsRepository _repository = NewsRepository.getInstance();

  final Observable<NewsResult<List<NewsItem>>> _newsResult = Observable(
    NewsResult.notInitialized(),
  );

  final Observable<DateTime?> _lastUpdateDate = Observable(
    null,
  );

  List<NewsItem> get news =>
      _newsResult.value.data?.where((e) => e.link.isNotEmpty).toList() ?? [];

  NewsResult<List<NewsItem>> get result => _newsResult.value;

  DateTime? get lastUpdateDate => _lastUpdateDate.value;

  NewsError? get error => _newsResult.value.error;

  bool get isLoading => result.isLoading;

  bool get hasError => result.isError;

  bool get hasSuccess => result.isSuccess;

  Future<void> onRefreshPressed() async {
    _setState(
      NewsResult.loading(
        data: _newsResult.value.data,
      ),
    );
    final result = await _repository.fetchNews();
    _setState(
      result,
    );
  }

  void _setState(
    NewsResult<List<NewsItem>> value,
  ) {
    runInAction(() {
      _newsResult.value = value;
      if (value.isSuccess) {
        _lastUpdateDate.value = DateTime.now();
      }
    });
  }
}
