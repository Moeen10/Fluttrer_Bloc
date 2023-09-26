import 'package:dio/dio.dart';
import 'package:single_test/data/models/post_model.dart';
import 'package:single_test/data/repository/api/api.dart';

class PostRepository{
 API api =API();

 Future<List<PostModel>> fetchPosts() async{
   try{

      Response response = await api.sendRequest.get('/posts');
      List<dynamic> postsDatas = response.data;
      return postsDatas.map((postdata) => PostModel.fromJson(postdata)).toList();
   }
   catch(e){
     print("@@@@@@@@@@");
    throw e;
   }
 }
}