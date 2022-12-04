import 'package:comments/View/comment_screen.dart';
import 'package:dio/dio.dart';
import '../Model/comments.dart';
import '../Model/comment.dart';

class DioClient {
  int n = 1;
  List<Response?> myList = [];
  final Dio _dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/comments/';

  Future<Comments?> getComment(int i) async {
    Comments? comment;
    //for (int i = n; i < n + 5; i++) {
    //print('${url + i.toString()}+1');
    i = i + 1;
    try {
      final commentData = await _dio.get(url + i.toString());
      //print(url + i.toString());
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

    //print(comment!.getBody());
    // myList.add(comment);
    //}
    //print(n);
    //n = n + 5;
    //print(comment!.body);
    return comment;

    // return myList;
  }

  Future createComment(final comm) async {
    Comments? comment;
    //print(comm);
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
