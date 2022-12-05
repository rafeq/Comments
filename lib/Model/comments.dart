import 'comment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comments.g.dart';

@JsonSerializable()
class CommentModel {
  CommentModel({
    required Comments this.comments,
  });

  Comments comments;

  Map<String, dynamic> toJson(data) => _$CommentModelToJson(this);
}
