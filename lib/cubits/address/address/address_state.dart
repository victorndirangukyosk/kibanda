part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.success(List<Address> addresses) = _Success;
  const factory AddressState.failed(String error) = _Failed;
}
