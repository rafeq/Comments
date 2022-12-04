import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comments {
  Comments({
    required this.postId,
    required this.name,
    required this.id,
    required this.email,
    required this.body,
  });
  int postId;
  int id;
  String name;
  @JsonKey(name: 'name')
  String email;
  @JsonKey(name: 'body')
  String body;

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);

  getName() {
    return name;
  }

  getBody() {
    return name;
  }
}
