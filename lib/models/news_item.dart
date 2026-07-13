import '../network/news/resp/news_item_from_network.dart';

class NewsItem {
  final String title;
  final String htmlContent;
  final DateTime? startDate;
  final String? link;
  final bool isTechnicalWork;

  const NewsItem({
    required this.title,
    required this.htmlContent,
    this.startDate,
    this.link,
    this.isTechnicalWork = false,
  });

  static NewsItem fromNetworkModel(
    NewsItemFromNetwork item,
  ) {
    return NewsItem(
      title: item.nameRu ?? '',
      htmlContent: item.htmlRu ?? '',
      startDate: item.startDate,
      link: item.link,
      isTechnicalWork: item.isTechnicalWork ?? false,
    );
  }

  static List<NewsItem> fromNetworkList(
    List<NewsItemFromNetwork> items,
  ) {
    return items.map((e) => NewsItem.fromNetworkModel(e)).toList();
  }
}
