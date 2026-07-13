import 'package:json_annotation/json_annotation.dart';

part 'news_item_from_network.g.dart';

@JsonSerializable(
  createToJson: false,
)
class NewsItemFromNetwork {
  @JsonKey(name: 'name_ru')
  final String? nameRu;

  @JsonKey(name: 'html_ru')
  final String? htmlRu;

  @JsonKey(name: 'is_technical_work')
  final bool? isTechnicalWork;

  @JsonKey(name: 'start_date')
  final DateTime? startDate;

  final String? link;

  NewsItemFromNetwork({
    this.nameRu,
    this.htmlRu,
    this.isTechnicalWork,
    this.startDate,
    this.link,
  });

  factory NewsItemFromNetwork.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromNetworkFromJson(
        json,
      );

  @override
  String toString() => 'NewsItemFromNetwork('
      'nameRu: $nameRu,'
      'htmlRu: $htmlRu,'
      'isTechnicalWork: $isTechnicalWork,'
      'startDate: $startDate,'
      'link: $link'
      ')';
}
