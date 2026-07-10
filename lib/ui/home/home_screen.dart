import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';
import '../../models/news_item.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/dimens/app_dimens.dart';
import '../../resources/images/app_images/app_images.dart';
import 'home_controller.dart';
import 'widgets/news_item_widget.dart';

part 'home_screen.app_bar_state.part.dart';

part 'home_screen.error_state.part.dart';

part 'home_screen.load_state.part.dart';

part 'home_screen.success_state.part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _onRefreshPressed();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final homeController = _homeController;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          kToolbarHeight + AppDimens.appBarBottomHeight,
        ),
        child: Observer(
          builder: (_) {
            return _buildAppBarWidget(
              lastUpdateDate: homeController.lastUpdateDate,
            );
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefreshPressed,
        child: Stack(
          children: [
            Observer(
              builder: (_) {
                return Visibility(
                  visible: homeController.isLoading,
                  child: _buildLoadingWidget(),
                );
              },
            ),
            Observer(
              builder: (_) {
                return Visibility(
                  visible: homeController.hasError,
                  child: _buildErrorWidget(
                    errorMessage: homeController.error?.errorMessage,
                    onRetryPressed: _onRefreshPressed,
                  ),
                );
              },
            ),
            Observer(
              builder: (_) {
                final news = homeController.news;
                return Visibility(
                  visible: homeController.hasSuccess,
                  child: _buildSuccessWidget(
                    news: news,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefreshPressed() async {
    await _homeController.onRefreshPressed();
  }
}
