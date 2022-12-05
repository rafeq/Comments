import 'package:flutter/material.dart';
import '../Controller/dio.dart';

class AddComment extends StatelessWidget {
  final DioClient client = DioClient();
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.text = "";
  }

  @override
  void initState() {}

  AddComment({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            width: 200,
            child: TextField(
              controller: fieldText,
              onChanged: ((value) => client.createComment(value)),
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                hintText: 'Please enter comment',
                labelText: 'Comment',
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  fieldText.clear();
                },
                child: const Text("ENTER"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
