part of 'home_screen.dart';

Widget _buildSuccessWidget({
  required List<NewsItem> news,
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
      );
    },
  );
}
