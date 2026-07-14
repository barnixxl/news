part of 'home_screen.dart';

Widget _buildAppBarWidget({required DateTime? lastUpdateDate}) {
  return AppBar(
    title: Text(strings.home_title),
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(AppDimens.appBarBottomHeight),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: AppColors.primaryDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strings.home_last_updated_at(
                lastUpdateDate?.toDayMonthYearTextDateFormat() ?? strings.common_absent_date,
              ),
              style: const TextStyle(color: AppColors.onPrimary, fontSize: AppDimens.fontXs),
            ),
          ],
        ),
      ),
    ),
  );
}
