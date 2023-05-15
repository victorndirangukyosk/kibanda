part of 'save_address_cubit.dart';

@freezed
class SaveAddressState with _$SaveAddressState {
  const factory SaveAddressState.initial() = _Initial;
  const factory SaveAddressState.loading() = _Loading;
  const factory SaveAddressState.success() = _Success;
  const factory SaveAddressState.failed(String error) = _Failed;
}
