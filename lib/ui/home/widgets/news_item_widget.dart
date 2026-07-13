import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/news_item.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/dimens/app_dimens.dart';
import '../../../resources/images/app_images/app_images.dart';
import '../../../utils/date_formatter.dart';
import '../../common/app_card/app_card_widget.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsItem newsItem;
  final void Function(String) onLinkPressed;

  const NewsItemWidget({super.key, required this.newsItem, required this.onLinkPressed});

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      clipContent: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsItem.title,
            style: const TextStyle(color: AppColors.primary, fontSize: AppDimens.fontMd, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              strings.home_news_published_at(newsItem.startDate.toDayMonthYearTextDateFormat() ?? ''),
              style: const TextStyle(color: AppColors.primaryGray, fontSize: AppDimens.fontXs),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => onLinkPressed.call(newsItem.link),
              icon: Image.asset(
                AppImages.icOpenInNew,
                width: AppDimens.iconXs,
                height: AppDimens.iconXs,
                color: AppColors.primary,
              ),
              label: Text(strings.read_more),
            ),
          ),
        ],
      ),
    );
  }
}
