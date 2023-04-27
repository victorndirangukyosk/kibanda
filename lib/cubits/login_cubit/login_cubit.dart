import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/api_response/api_response.dart';
import 'package:kibanda_kb/models/login_response/login_response.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: 'login'));
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data!);
      emit(LoginSuccess(loginResponse: loginResponse));
    } on String catch (e) {
      emit(LoginFailed(error: e));
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }

  // kwikLogin({required Map<String, dynamic> data}) async {
  //   emit(LoginLoading());
  //   try {
<<<<<<< HEAD
  //     ApiResponse apiResponse = ApiResponse.fromJson(await ApiService.postKwik(
  //         data: data, path: '/admin/index.php?path=common/login'));
=======
  //     ApiResponse apiResponse = ApiResponse.fromJson(await ApiService.post(
  //         data: data, 
  //         // path: '/admin/index.php?path=common/login'
  //         path: 
  //         ));
>>>>>>> a3b8aa894727667b6b90ee91467c48038cf6bd45
          
  //     LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data!);
  //     emit(LoginSuccess(loginResponse: loginResponse));
  //   } on String catch (e) {
  //     emit(LoginFailed(error: e));
  //   }
  // }
}
