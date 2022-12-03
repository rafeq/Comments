/*import 'package:comments/View/comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddComment extends StatelessWidget {
  //const AddComment({super.key});
  //final CommentController _commentController = CommentController();
  final myCommentController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myCommentController.dispose();
  }

  @override
  void initState() {}

  AddComment({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myCommentController,
      //onSaved: (item) => _commentController.comments,
      decoration: const InputDecoration(
        icon: Icon(Icons.comment),
        hintText: 'Please enter comment',
        labelText: 'Comment',
      ),
    );
  }
}*/
