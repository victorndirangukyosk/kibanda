import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/services.dart';

part 'create_kibanda_state.dart';
part 'create_kibanda_cubit.freezed.dart';

class CreateKibandaCubit extends Cubit<CreateKibandaState> {
  CreateKibandaCubit() : super(const CreateKibandaState.initial());

  createKibanda({required data}) async {
    emit(const CreateKibandaState.loading());
    try {
      await ApiService.postKwik(
          data: {
            ...data,
            'customer_group_id': 15,
            'customer_experience_id':
          },
          path: '/api/customer/signup/signupByOtp',
          options: Options(
            headers: {
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              'X-User': 'customer'
            },
          ));

      emit(const CreateKibandaState.success());
    } catch (e) {
      emit(const CreateKibandaState.failed());
    }
  }

  verifyKibanda({required Map<String, dynamic> data}) async {
    emit(const CreateKibandaState.loading());
    try {
      await ApiService.postKwik(
          data: {...data, 'customer_group_id': 15, 'customer_experience_id' :},
          path: '/api/customer/signup/signupVerifyOtp',
          options: Options(
            headers: {
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              'X-User': 'customer'
            },
          ));

      emit(const CreateKibandaState.success());
    } catch (e) {
      emit(const CreateKibandaState.failed());
    }
  }
}
