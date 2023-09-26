import 'package:single_test/data/models/post_model.dart';

abstract class PostState{}


class LoadingState extends PostState{}

class GetDataState extends PostState{
  final List<PostModel> posts;
  GetDataState(this.posts);
}

class ErrorMesageState extends PostState{
  final String error;
  ErrorMesageState(this.error);
}