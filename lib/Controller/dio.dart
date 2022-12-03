import 'package:comments/View/comment_screen.dart';
import 'package:dio/dio.dart';
import '../Model/comments.dart';
import '../Model/comment.dart';

class DioClient {
  int n = 1;
  List<Comments> myList = [];
  final Dio _dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/comments/';

  Future<List<Comments>> getComment() async {
    Comments? comment;
    for (int i = n; i < n + 20; i++) {
      try {
        Response commentData = await _dio.get(url + i.toString());
        //print(i);
        //print('comments: ${commentData.toString()}');
        comment = Comments.fromJson(commentData.data);
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

      //print(i);
      myList.add(comment!);
    }
    n = n + 20;

    return myList;
  }

  Future createComment(final comm) async {
    Comments? comment;
    print(comm);
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
