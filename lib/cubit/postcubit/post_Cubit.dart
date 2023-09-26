

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_test/cubit/postcubit/state_cubit.dart';
import 'package:single_test/data/models/post_model.dart';
import 'package:single_test/data/repository/post_repository.dart';

class PostCubit extends Cubit<PostState>{
  PostCubit() : super(LoadingState()){
    fetchPosts();
  }
  PostRepository postRepository =PostRepository();

  void fetchPosts()async{
    try{
       List<PostModel>posts =  await postRepository.fetchPosts();
       emit(GetDataState(posts));
    }
    catch(e){
      emit(ErrorMesageState(e.toString()));
      print("---------  ERROR From post_Cubit--------fetchPosts() functions");
      throw e;
    }
  }
}