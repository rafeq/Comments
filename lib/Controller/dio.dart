import 'package:dio/dio.dart';
import '../Model/comment.dart';

class DioClient {
  int n = 1;
  List myList = [];
  final Dio _dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/comments/';

  Future<List> getComment() async {
    Comment? comment;
    //load 20 comments
    for (int i = n; i <= n + 20; i++) {
      try {
        final data = await _dio.get(url + i.toString());

        comment = Comment.fromJson(data.data);
      } on DioError catch (e) {
        if (e.response == null) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
        } else {
          print('Error sending request!');
          print(e.message);
        }
      }
      myList.add(Comment(
        postId: comment!.postId,
        name: comment.name,
        id: comment.id,
        email: comment.email,
        body: comment.body,
      ));
    }
    n = n + 20;
    return myList;
  }

//to creat comment but fall because the website not real
  Future createComment(final comm) async {
    Comment? comment;
    const myUrl = 'https://cambium.co.il/test/testAssignComment';
    try {
      Response response = await _dio.post(
        myUrl,
        data: comm.toJson(),
      );

      print('Comment created: ${response.data}');

      comment = comm.fromJson(response.data);
    } catch (e) {
      print('Error creating commant: $e');
    }
  }
}
