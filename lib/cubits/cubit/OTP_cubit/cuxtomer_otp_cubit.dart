import 'package:bloc/bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:kibanda_kb/cubits/cubit/authentication/token_cubit.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'cuxtomer_otp_state.dart';
part 'cuxtomer_otp_cubit.freezed.dart';

class CuxtomerOtpCubit extends Cubit<CuxtomerOtpState> {
  CuxtomerOtpCubit() : super(const CuxtomerOtpState.initial());
  // TokenCubit tokenCubit = GetIt.I<TokenCubit>();

  fetchOTP({required data}) async {
    emit(const CuxtomerOtpState.loading());
    try {
      // final jwt = JWT.decode(tokenCubit.state);

      await ApiService.postKwik(
          data: data,
          path:
              '/api/customer/signup/signupByOtp/api/customer/signup/FetchCustomerOTP',
          options: Options(
            headers: {
              'Content-Type':
                  'application/x-www-form-urlencoded; charset=UTF-8',
              'X-User': 'customer'
            },
          ));

      emit(const CuxtomerOtpState.success());
    } catch (e) {
      emit(const CuxtomerOtpState.failed());
    }
  }
}
