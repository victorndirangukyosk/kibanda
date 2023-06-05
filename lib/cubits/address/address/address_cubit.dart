import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/address/address.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'address_state.dart';
part 'address_cubit.freezed.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(const AddressState.initial());
  getAddresses() async {
    emit(const AddressState.loading());
    try {
      var response = await ApiService.getDataWithCustomerAuth(
          path: 'customer/address/alladdress');
      List addresses = response['data']['delivery_addresses'];
      emit(AddressState.success(List.generate(
          addresses.length, (index) => Address.fromJson(addresses[index]))));
    } catch (e) {
      emit(AddressState.failed(e.toString()));
    }
  }
}
