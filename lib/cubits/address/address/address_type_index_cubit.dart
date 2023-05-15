import 'package:flutter_bloc/flutter_bloc.dart';

class AddressTypeIndexCubit extends Cubit<int> {
  AddressTypeIndexCubit(int initialState) : super(initialState);
  change(int val) {
    emit(val);
  }
}
