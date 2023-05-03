import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
      var phone = data['telephone'];
     var res= await ApiService.postKwik(
        data: {
          'phone': phone,
        },
        path: '/api/customer/signup/FetchCustomerOTP?phone=$phone',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-User': 'customer'
          },
        ),
      );

      emit(CuxtomerOtpState.success(res));
    } catch (e) {
      emit(const CuxtomerOtpState.failed());
    }
  }
}
