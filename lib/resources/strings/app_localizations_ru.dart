// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get home_title => 'Новости от Беларусбанка';

  @override
  String get loading_news => 'Загрузка новостей...';

  @override
  String get error => 'Ошибка...';

  @override
  String get retry => 'Повторить';

  @override
  String get common_absent_date => 'Дата отсутствует';

  @override
  String get error_timeout => 'Время соединения вышло';

  @override
  String get error_no_internet => 'Проверьте соединение с интернетом';

  @override
  String error_server(int statusCode) {
    return 'Ошибка сервера: $statusCode';
  }

  @override
  String error_bad_response(int statusCode) {
    return 'Неверный ответ сервера: $statusCode';
  }

  @override
  String get error_cancelled => 'Запрос отменен';

  @override
  String get error_unknown => 'Неизвестная ошибка сети';

  @override
  String get error_parsing => 'Ошибка парсинга данных';

  @override
  String get error_no_data => 'Нет данных';

  @override
  String get error_load_failed => 'Ошибка загрузки данных';

  @override
  String home_news_published_at(String date) {
    return 'Опубликовано: $date';
  }

  @override
  String home_last_updated_at(String date) {
    return 'Обновлено: $date';
  }

  @override
  String get read_more => 'Читать';
}
