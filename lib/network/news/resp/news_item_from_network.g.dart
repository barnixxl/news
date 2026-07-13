// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_from_network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItemFromNetwork _$NewsItemFromNetworkFromJson(Map<String, dynamic> json) =>
    NewsItemFromNetwork(
      nameRu: json['name_ru'] as String?,
      htmlRu: json['html_ru'] as String?,
      isTechnicalWork: json['is_technical_work'] as bool?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      link: json['link'] as String?,
    );
