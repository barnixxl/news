import 'package:mobx/mobx.dart';

import '../../models/news_error.dart';
import '../../models/news_item.dart';
import '../../models/news_result.dart';
import '../../repository/news_repository.dart';

class HomeController {
  final NewsRepository _repository = NewsRepository.getInstance();

  final Observable<NewsResult<List<NewsItem>>> _newsResult = Observable(NewsResult.notInitialized());

  List<NewsItem> get news => _newsResult.value.data ?? [];

  NewsResult<List<NewsItem>> get result => _newsResult.value;

  DateTime? get lastUpdateDate => _lastUpdateDateFromData(_newsResult.value.data);

  NewsError? get error => _newsResult.value.error;

  bool get isLoading => result.isLoading;

  bool get hasError => result.isError;

  bool get hasSuccess => result.isSuccess;

  Future<void> onRefreshPressed() async {
    _setState(NewsResult.loading(data: _newsResult.value.data));
    final result = await _repository.fetchNews();
    _setState(result);
  }

  DateTime? _lastUpdateDateFromData(List<NewsItem>? data) {
    if (data != null && data.isNotEmpty) {
      return data.first.startDate;
    }
    return null;
  }

  void _setState(NewsResult<List<NewsItem>> value) {
    runInAction(() {
      _newsResult.value = value;
    });
  }
}
