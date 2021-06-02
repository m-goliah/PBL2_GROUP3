// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return Memo(
    title: json['title'] as String,
    body: json['body'] as String,
    tag: (json['tag'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
  );
}

Map<String, dynamic> _$MemoToJson(Memo instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'tag': instance.tag,
    };
