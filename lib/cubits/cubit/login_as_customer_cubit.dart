import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kibanda_kb/models/kibanda_model/kibanda.dart';
import 'package:kibanda_kb/services/api_service/api_service.dart';

part 'login_as_customer_state.dart';
part 'login_as_customer_cubit.freezed.dart';

class LoginAsCustomerCubit extends Cubit<LoginAsCustomerState> {
  LoginAsCustomerCubit() : super(LoginAsCustomerState.initial());
  loginAsCustomer({required Kibanda selectedKibanda}) async {
    emit(const LoginAsCustomerState.loading());
    var response = await ApiService.postCustomer(data: {
      'telephone': selectedKibanda.telephone,
      'email': selectedKibanda.email
    }, path: 'customer/login/loginascustomer');
    emit(LoginAsCustomerState.success(data: response));
  }
}
