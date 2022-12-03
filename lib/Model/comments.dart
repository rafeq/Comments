import 'comment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments.g.dart';

@JsonSerializable()
class CommentModel {
  CommentModel({
    required this.comments,
  });

  Comments comments;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson(data) => _$CommentModelToJson(this);
}
