import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../config/app_config.dart';
import '../../models/news_error.dart';
import '../../models/news_item.dart';
import '../../models/news_result.dart';
import '../news_network.dart';
import 'resp/news_item_from_network.dart';

class NewsApi {
  static final GetIt _getIt = GetIt.instance;

  late final NewsNetwork _network;

  void register(GetIt getIt) {
    getIt.registerSingleton<NewsApi>(this);
  }

  Future<void> initializeDependencies() async {
    _network = _getIt<NewsNetwork>();
  }

  static NewsApi getInstance() {
    return _getIt<NewsApi>();
  }

  Future<NewsResult<List<NewsItem>>> fetchNews() async {
    final result = await _network.get<List<dynamic>>('news_info', queryParameters: _buildQueryParams());
    return _processNetworkResult(result);
  }

  Map<String, String> _buildQueryParams() {
    return {'lang': AppConfig.language};
  }

  NewsResult<List<NewsItem>> _processNetworkResult(NewsResult<List<dynamic>> result) {
    if (result.isSuccess) {
      return _parseNewsData(result.data ?? const []);
    }
    return NewsResult.failure(result.error ?? NewsError.unknown());
  }

  NewsResult<List<NewsItem>> _parseNewsData(List<dynamic> data) {
    try {
      final items = data.map((e) => NewsItemFromNetwork.fromJson(e as Map<String, dynamic>)).toList();
      if (items.isNotEmpty) {
        return NewsResult.success(NewsItem.fromNetworkList(items));
      }
      return NewsResult.failure(NewsError.noData());
    } catch (e) {
      debugPrint(e.toString());
      return NewsResult.failure(NewsError.fromException(e));
    }
  }
}
