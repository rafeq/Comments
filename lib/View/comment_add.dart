import 'package:flutter/material.dart';
import '../Controller/dio.dart';

class AddComment extends StatelessWidget {
  //const AddComment({super.key});
  //final CommentController _commentController = CommentController();
  final myCommentController = TextEditingController();
  final DioClient client = DioClient();
  final fieldText = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myCommentController.dispose();
  }

  void clearText() {
    fieldText.clear();
  }

  @override
  void initState() {}

  AddComment({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldText,
      onChanged: ((value) => client.createComment(value)),
      decoration: const InputDecoration(
        icon: Icon(Icons.comment),
        hintText: 'Please enter comment',
        labelText: 'Comment',
      ),
    );
  }
}
