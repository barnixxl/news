part of 'home_screen.dart';

Widget _buildSuccessWidget({
  required List<NewsItem> news,
  required void Function(
      String link,
      ) onLinkPressed,
}) {
  return ListView.builder(
    padding: const EdgeInsets.all(
      8,
    ),
    itemCount: news.length,
    itemBuilder: (
        _,
        index,
        ) {
      final item = news[index];
      return NewsItemWidget(
        newsItem: item,
        onLinkPressed: onLinkPressed,
      );
    },
  );
}
