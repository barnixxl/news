import 'package:json_annotation/json_annotation.dart';

part 'news_item_from_network.g.dart';

@JsonSerializable(
  createToJson: false,
)
class NewsItemFromNetwork {
  @JsonKey(name: 'name_ru')
  final String? nameRu;

  @JsonKey(name: 'is_technical_work')
  final bool? isTechnicalWork;

  @JsonKey(name: 'start_date')
  final String? startDate;

  final String? link;

  NewsItemFromNetwork({
    this.nameRu,
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
      'isTechnicalWork: $isTechnicalWork,'
      'startDate: $startDate,'
      'link: $link'
      ')';
}
