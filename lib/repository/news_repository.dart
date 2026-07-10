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
    return await _newsApi.fetchNews();
  }
}
