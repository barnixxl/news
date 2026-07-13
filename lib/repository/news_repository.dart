import 'package:get_it/get_it.dart';

import '../models/news_item.dart';
import '../models/news_result.dart';
import '../network/news/news_api.dart';
import 'base_repository.dart';

class NewsRepository extends BaseRepository {
  static final GetIt _getIt = GetIt.instance;

  late final NewsApi _newsApi;

  @override
  void register(
      GetIt getIt,
      ) {
    getIt.registerSingleton<NewsRepository>(
      this,
    );
  }

  @override
  Future<void> initializeDependencies() async {
    _newsApi = _getIt<NewsApi>();
  }

  static NewsRepository getInstance() {
    return _getIt<NewsRepository>();
  }

  Future<NewsResult<List<NewsItem>>> fetchNews() async {
    final result = await _newsApi.fetchNews();
    if (result.isSuccess) {
      final data = result.data;
      if (data != null) {
        return NewsResult.success(
          _sortByDate(
            data.where((e) => !e.isTechnicalWork).toList(),
          ),
        );
      }
    }
    return result;
  }

  List<NewsItem> _sortByDate(
      List<NewsItem> items,
      ) {
    final sorted = List<NewsItem>.from(items);
    sorted.sort(
          (
            a,
            b,
          ) {
        final aDt = a.startDate;
        final bDt = b.startDate;
        if (aDt == null && bDt == null) {
          return 0;
        }
        if (aDt == null) {
          return 1;
        }
        if (bDt == null) {
          return -1;
        }
        return bDt.compareTo(aDt);
      },
    );
    return sorted;
  }
}
