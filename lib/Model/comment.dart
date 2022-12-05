import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment({
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

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}
