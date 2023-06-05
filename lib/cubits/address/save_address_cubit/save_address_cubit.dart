import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'save_address_state.dart';
part 'save_address_cubit.freezed.dart';

class SaveAddressCubit extends Cubit<SaveAddressState> {
  SaveAddressCubit() : super(SaveAddressState.initial());

  saveAddress({required Map<String, dynamic> data}) async {
    emit(SaveAddressState.loading());
    try {
      await ApiService.postDataOrder(
          data: data, path: 'customer/address/address');
      emit(SaveAddressState.success());
    } catch (e) {
      emit(SaveAddressState.failed(e.toString()));
    }
  }
}
