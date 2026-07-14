import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'network/news/news_api.dart';
import 'network/news_network.dart';
import 'repository/news_repository.dart';
import 'resources/colors/app_colors.dart';
import 'resources/strings/app_localizations.dart';
import 'ui/home/home_screen.dart';

late final AppLocalizations strings;

Future<void> initializeLocale() async {
  await initializeDateFormatting(
    'ru',
    null,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeLocale();
  strings = lookupAppLocalizations(
    const Locale(
      'ru',
    ),
  );
  final getIt = GetIt.instance;

  final newsNetwork = NewsNetwork();
  newsNetwork.register(
    getIt,
  );
  await newsNetwork.initializeDependencies();

  final newsApi = NewsApi();
  newsApi.register(
    getIt,
  );
  await newsApi.initializeDependencies();

  final repository = NewsRepository();
  repository.register(
    getIt,
  );
  await repository.initializeDependencies();

  runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale(
        'ru',
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
