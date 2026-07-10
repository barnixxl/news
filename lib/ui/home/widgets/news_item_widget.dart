import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../models/news_item.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/dimens/app_dimens.dart';
import '../../../resources/images/app_images/app_images.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (newsItem.imageUrl != null && newsItem.imageUrl!.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  AppDimens.radiusMd,
                ),
              ),
              child: Image.network(
                newsItem.imageUrl!,
                height: AppDimens.newsImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) =>
                    _buildPlaceholderImage(),
                loadingBuilder: (
                  context,
                  child,
                  loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    height: AppDimens.newsImageHeight,
                    color: AppColors.primaryLight,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          Padding(
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
                if (newsItem.startDate != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text(
                      strings.news_date_format(
                        '${newsItem.startDate!.day}.${newsItem.startDate!.month}.${newsItem.startDate!.year}',
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
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: AppDimens.newsImageHeight,
      color: AppColors.primaryLight,
      child: Center(
        child: Image.asset(
          AppImages.icPlaceholder,
          width: AppDimens.iconLg,
          height: AppDimens.iconLg,
        ),
      ),
    );
  }
}
