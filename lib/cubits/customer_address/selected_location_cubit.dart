import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_geocoder/geocoder.dart';

class SelectedLocationCubit extends Cubit<Address?> {
  SelectedLocationCubit(Address? initialState)
      : super(initialState);

  save(Address autocompletePrediction) {
    emit(autocompletePrediction);
  }
}
