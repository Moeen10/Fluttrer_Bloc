import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_test/blocs/SignIn/sign_in_event.dart';
import 'package:single_test/blocs/SignIn/sign_in_state.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent , SignInState>{
  SignInBloc() : super(SignInInitialState()){
    on<SignInSubmitEvent>((event, emit) => {
    emit(SignInLoadingState())
    });
    on<SignInTextChangeEvent>((event, emit) => {
      if(event.emailValue == '' &&  !EmailValidator.validate(event.emailValue)  ){
        emit(SignInErrorState("Insert Your Email"))
      }
      else if(event.passwordValue.length<6){
        emit(SignInErrorState("Insert Password"))
      }
      else{
        emit(SignInValidState())
        }
    });
  }
}
