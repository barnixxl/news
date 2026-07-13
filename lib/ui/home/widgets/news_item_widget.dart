import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/news_item.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/dimens/app_dimens.dart';
import '../../../utils/date_formatter.dart';
import '../../common/app_card/app_card_widget.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsItem newsItem;

  const NewsItemWidget({
    super.key,
    required this.newsItem,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    return AppCardWidget(
      clipContent: true,
      child: Padding(
        padding: const EdgeInsets.all(
          12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem.title,
              style: const TextStyle(
                color: AppColors.onPrimary,
                fontSize: AppDimens.fontMd,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                strings.news_date_format(
                  newsItem.startDate.toDayMonthYearTextDateFormat() ?? '',
                ),
                style: const TextStyle(
                  color: AppColors.primaryGray,
                  fontSize: AppDimens.fontXs,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
