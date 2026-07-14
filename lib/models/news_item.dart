import '../network/news/resp/news_item_from_network.dart';
import '../utils/string_extensions.dart';

class NewsItem {
  final String title;
  final DateTime? startDate;
  final String link;
  final bool isTechnicalWork;

  const NewsItem({
    required this.title,
    this.startDate,
    required this.link,
    this.isTechnicalWork = false,
  });

  static NewsItem fromNetworkModel(NewsItemFromNetwork item) {
    return NewsItem(
      title: item.nameRu ?? '',
      startDate: item.startDate.toDayMonthYearDateParse(),
      link: item.link ?? '',
      isTechnicalWork: item.isTechnicalWork ?? false,
    );
  }

  static List<NewsItem> fromNetworkList(List<NewsItemFromNetwork> items) {
    return items.map(
      (e) => NewsItem.fromNetworkModel(e),
    ).toList();
  }
}
