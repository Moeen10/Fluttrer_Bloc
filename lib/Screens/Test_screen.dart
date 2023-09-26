import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_test/cubit/InternetCubit.dart';
import 'package:single_test/cubit/postcubit/post_Cubit.dart';
import 'package:single_test/cubit/postcubit/state_cubit.dart';
import 'package:single_test/data/models/post_model.dart';
import 'package:single_test/data/repository/post_repository.dart';

class TestPage extends StatelessWidget {
   TestPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("test"),
      ),
      body: SafeArea(
        
        child: Column(
          children: [
            BlocConsumer<InternetCubit , InternetState>(
              listener: (context, state)  {
                if(state == InternetState.connect){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected"),backgroundColor: Colors.blue));
                }
                if(state == InternetState.disconnect){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Disconnected"), backgroundColor: Colors.red,));
                }
              },
              builder: (context, state)  {
                if(state == InternetState.connect){
                  return  Expanded(
                    child: BlocBuilder<PostCubit,PostState >(
                      builder: (context, state) {
                        if(state is LoadingState){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if(state is GetDataState){
                          return ListView.builder(

                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.posts[index].title.toString()),
                              );
                            },
                          );
                        }
                        return  Center(
                          child: Text("Here have an error"),
                        );
                      },
                    ),
                  );
                }
                if(state == InternetState.disconnect){
                  return Text("Disconnected");
                }
                return Text("Connecting...");
              },

            ),

          ],
        ),
      ),
    );
  }
}
