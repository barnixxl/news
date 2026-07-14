import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/news_error.dart';
import '../../models/news_item.dart';
import '../../models/news_result.dart';
import '../../repository/news_repository.dart';

class HomeController {
  final NewsRepository _repository = NewsRepository.getInstance();

  final Observable<NewsResult<List<NewsItem>>> _newsResult = Observable(
    NewsResult.notInitialized(),
  );

  final Observable<DateTime?> _lastFetchedAt = Observable(
    null,
  );

  List<NewsItem> get news => _newsResult.value.data ?? [];

  DateTime? get lastFetchedAt => _lastFetchedAt.value;

  NewsError? get error => _newsResult.value.error;

  bool get isLoading => _newsResult.value.isLoading;

  bool get hasError => _newsResult.value.isError;

  bool get hasSuccess => _newsResult.value.isSuccess;

  Future<void> loadNews() async {
    _setState(
      NewsResult.loading(
        data: _newsResult.value.data,
      ),
    );
    final result = await _repository.fetchNews();
    _setState(result);
  }

  Future<void> openLink(
      String link,
      ) async {
    final uri = Uri.tryParse(
      link,
    );
    if (uri != null &&
        await canLaunchUrl(
          uri,
        )) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  void _setState(
      NewsResult<List<NewsItem>> value,
      ) {
    runInAction(() {
      _newsResult.value = value;
      if (value.isSuccess) {
        _lastFetchedAt.value = DateTime.now();
      }
    });
  }
}
