import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/services.dart';

part 'create_kibanda_state.dart';
part 'create_kibanda_cubit.freezed.dart';

class CreateKibandaCubit extends Cubit<CreateKibandaState> {
  CreateKibandaCubit() : super(CreateKibandaState.initial());

  createKibanda({required data}) async {
    emit(CreateKibandaState.loading());
    try {
      await ApiService.post(
          data: data,
          path: '/api/customer/signup/signupByOtp',
          options: Options(
            headers: {
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              'X-User': 'customer'
            },
          ));

      emit(CreateKibandaState.success());
    } catch (e) {
      emit(CreateKibandaState.failed());
    }
  }

  verifyKibanda({required Map<String, dynamic> data}) async {
    emit(CreateKibandaState.loading());
    try {
      await ApiService.post(
          data: {...data, 'customer_group_id': kDebugMode ? 14 : 15},
          path: '/api/customer/signup/signupVerifyOtp',
          options: Options(
            headers: {
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              'X-User': 'customer'
            },
          ));

      emit(CreateKibandaState.success());
    } catch (e) {
      emit(CreateKibandaState.failed());
    }
  }
}
