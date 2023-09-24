import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:single_test/blocs/SignIn/sign_in_bloc.dart';
import 'package:single_test/blocs/SignIn/sign_in_event.dart';
import 'package:single_test/blocs/SignIn/sign_in_state.dart';

class SignWithEmail extends StatelessWidget {
   // SignWithEmail({Key? key}) : super(key: key);
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInErrorState){
                    return Text("${state.errorMessage}", style: TextStyle(color: Colors.red),);
                  }
                  else{
                    return Container();
                  }

                }
                ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        hintText: "Give your email",
                        hintStyle: TextStyle(color: Colors.black12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: emailController,
                      onChanged: (value) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInTextChangeEvent(emailController.text, passwordController.text)
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: "Give your Password",
                        hintStyle: TextStyle(color: Colors.black12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: passwordController,
                      onChanged: (value) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInTextChangeEvent(emailController.text, passwordController.text)
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              BlocBuilder<SignInBloc,SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState){
                    return SpinKitThreeInOut(
                        color: Colors.blue,
                        size: 50.0,
                      );
                  }
                  return SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: (state is SignInValidState)? Colors.purple : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Replace 20 with your desired border radius.
                          ),
                        ),
                        onPressed: () {
                          if(state is SignInValidState){
                            BlocProvider.of<SignInBloc>(context).add(SignInSubmitEvent(emailController.text, passwordController.text));
                          }
                        },
                        child: Text("Submit"),
                      ),
                    );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
