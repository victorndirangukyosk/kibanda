part of 'cuxtomer_otp_cubit.dart';

@freezed
class CuxtomerOtpState with _$CuxtomerOtpState {
  const factory CuxtomerOtpState.initial() = _Initial;
  const factory CuxtomerOtpState.loading() = _Loading;
  const factory CuxtomerOtpState.success() = _Success;
  const factory CuxtomerOtpState.failed() = _Failed;
}
