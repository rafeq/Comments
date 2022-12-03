import 'comment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments.g.dart';

@JsonSerializable()
class CommentModel {
  CommentModel(
    int postId,
    String name,
    int id,
    String body,
    String email, {
    required this.comments,
  });

  Comments comments;

  // Map<String, dynamic> toJson(data) => _$CommentModelToJson(this);
}
