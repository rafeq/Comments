// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentsFromJson(Map<String, dynamic> json) {
  return Comment(
    postId: json['postId'] as int,
    name: json['name'] as String,
    id: json['id'] as int,
    email: json['email'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$CommentsToJson(Comment instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
